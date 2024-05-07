import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PostListPage extends StatefulWidget {
  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<Post> posts = [];
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();   
  }

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        print('object4');

    if (response.statusCode == 200) {
      
      final List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        posts = responseData.map((json) => Post.fromJson(json)).toList();
      });

      for(int i = 0; i<posts.length; i++){
      
        final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/${posts[i].userId}'));

        if (response.statusCode == 200) {
         
          var decodedObject = jsonDecode(response.body);

          // Mengambil nilai dari kunci "name" dan "username"
          String nama = decodedObject["name"];
          String usernama = decodedObject["username"];

          // Membuat objek User baru
          User newUser = User(nama, usernama);
          
          // Menambahkan objek User ke dalam list user
          userList.add(newUser);   
        } 
        else {
          throw Exception('Failed to load user');
        }
      }
    } 
    else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
  '< Post List Page >',
  style: TextStyle(color: Color.fromARGB(255, 33, 88, 251), fontWeight: FontWeight.bold),
),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 119, 114),
      ),
      backgroundColor:
          Color.fromARGB(255, 254, 254, 254), 
          
      body: ListView.builder(
        
        itemCount: posts.length,
        itemBuilder: (context, index) {
  
          return Card(      
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              //Title
              title: Text('Name : ${userList[index].name} \nUsername : ${userList[index].username} \nTitle: ${posts[index].title}',
              //style bold
              style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(posts[index].body),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailPage(post: posts[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PostDetailPage extends StatelessWidget {
  final Post post;

  PostDetailPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
        backgroundColor: Colors.white,
      ),
      backgroundColor:
          Color.fromARGB(255, 160, 160, 160), // Background color abu-abu
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Text('Title : ${post.title}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post.body,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: CommentList(postId: post.id),
          ),
        ],
      ),
    );
  }
}

class CommentList extends StatefulWidget {
  final int postId;

  CommentList({required this.postId});

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/${widget.postId}/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        comments = responseData.map((json) => Comment.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Comments', // Menambahkan judul 'Comments'
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: ListTile(
                  title: Text('Username : ${comments[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comments[index].body),
                      Text(
                        'Email: ${comments[index].email}',
                        style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Post {
  final int id, userId;
  final String title, body;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId : json['userId']
    );
  }
}

class Comment {
  final String name, body, email;

  Comment({
    required this.name,
    required this.body,
    required this.email,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'],
      body: json['body'],
      email: json['email'],
    );
  }
}

class User {
  String name;
  String username;

  User(this.name, this.username);

  @override
  String toString() {
    return 'User{name: $name, username: $username}';
  }
}
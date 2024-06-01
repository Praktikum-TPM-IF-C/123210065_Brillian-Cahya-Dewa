import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class ProfilPage extends StatelessWidget {
  
  Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
    (Route<dynamic> route) => false,
  );
}

//   Future<void> getUsername() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? username = prefs.getString('username');
//   usernama = username!;
//   // print('Logged in username: $username');
  
// }

  void _onBottomNavTapped(BuildContext context, int index) { // Add BuildContext parameter
    switch (index) {
      case 0:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;  
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartDetailPage()));
        break;
      case 2:
        // Do nothing, already on Profil Page
    }
  }

  @override
  
  Widget build(BuildContext context) {
    
    return  Scaffold(
      
      appBar: AppBar(
        
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text('Profile'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              
              accountName: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 10, 105, 182)),
              ),
              accountEmail: Text(
                '-',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 10, 105, 182)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png'),
              ),
            ),
            ExpansionTile(
              leading: Icon(Icons.info),
              title: Text("What's New?"),
              children: <Widget>[
                ListTile(
                  title: Text('2.0 Version'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () 
                => logout(context),   
            ),
          ],
        ),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.userCircle,
              size: 100, // Adjust the size as needed
              color: Colors.blue, // Adjust the color as needed
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                Text(
                  'Welcome,',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 136, 127, 127)),
                ),
                SizedBox(height: 8),
                Text(
                  'Username',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 136, 127, 127)),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 11, 5, 31).withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.white),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, color: Colors.white),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Update this based on the current page index
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: (index) => _onBottomNavTapped(context, index), // Pass the context here
      ),
    );
  }
}

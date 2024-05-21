class Akun{
  final String username;
  final String password;

  Akun(
    {required this.username,
    required this.password}
  );
}

List<Akun> akun = [
  Akun(
    username : "",
    password : ""
  )
];
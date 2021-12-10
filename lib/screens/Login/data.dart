class User {
  final String username;
  final String password;
  User({
    this.username,
    this.password,
  });

  List<User> users = [
    User(
      username: "user1",
      password: "password1",
    ),
    User(
      username: "user2",
      password: "password2",
    ),
    User(
      username: "user3",
      password: "password3",
    ),
  ];
}

class User {
  String name;
  String email;
  String password;

  User({
    this.name,
    this.email,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'email': email,
  };
}
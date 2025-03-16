class User {
  final int id;
  final String username;

  User({required this.id, required this.username});

  Map<String, dynamic> toJson() => {'id': id, 'username': username};

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['username']);
  }
}
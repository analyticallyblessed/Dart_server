import '../models/user.dart';

class UserRepository {
  // Simulated database (replace with real DB if needed)
  final _users = <String, String>{'test': 'password123'}; // username: password

  Future<User?> findUserByUsername(String username) async {
    if (_users.containsKey(username)) {
      return User(id: 1, username: username);
    }
    return null;
  }

  Future<bool> validateCredentials(String username, String password) async {
    return _users[username] == password;
  }
}
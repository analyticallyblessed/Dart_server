import '../entities/user.dart';
import '../../data/repositories/user_repository.dart';
import '../../utils/jwt_helper.dart';

class AuthService {
  final UserRepository _repository;

  AuthService(this._repository);

  Future<String?> login(String username, String password) async {
    final isValid = await _repository.validateCredentials(username, password);
    if (!isValid) return null;

    final user = await _repository.findUserByUsername(username);
    if (user == null) return null;

    return JwtHelper.generateToken(user.id.toString());
  }
}
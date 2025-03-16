import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JwtHelper {
  static const String _secret = 'your-secret-key'; // Replace with secure key

  static String generateToken(String userId) {
    final jwt = JWT({'id': userId});
    return jwt.sign(SecretKey(_secret));
  }

  static JWT? verifyToken(String token) {
    try {
      return JWT.verify(token, SecretKey(_secret));
    } catch (e) {
      return null;
    }
  }
}
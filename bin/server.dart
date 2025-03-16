import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import '../lib/application/controllers/auth_controller.dart';
import '../lib/domain/services/auth_service.dart';
import '../lib/data/repositories/user_repository.dart';

void main() async {
  final userRepo = UserRepository();
  final authService = AuthService(userRepo);
  final authController = AuthController(authService);

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(authController.router);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server running on ${server.address.host}:${server.port}');
}
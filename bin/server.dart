import 'dart:io' show Platform;
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

  final host = Platform.environment['HOST'] ?? '0.0.0.0';
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await io.serve(handler, host, port);
  print('Server running on $host:$port');
}
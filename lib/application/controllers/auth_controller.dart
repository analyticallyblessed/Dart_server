import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../domain/services/auth_service.dart';
import 'dart:convert';

class AuthController {
  final AuthService _authService;

  AuthController(this._authService);

  Router get router {
    final router = Router();
    router.post('/login', _login);
    return router;
  }

  Future<Response> _login(Request request) async {
    final body = jsonDecode(await request.readAsString());
    final username = body['username'] as String?;
    final password = body['password'] as String?;

    if (username == null || password == null) {
      return Response.badRequest(body: 'Missing username or password');
    }

    final token = await _authService.login(username, password);
    if (token == null) {
      return Response.forbidden('Invalid credentials');
    }

    return Response.ok(jsonEncode({'token': token}),
        headers: {'Content-Type': 'application/json'});
  }
}
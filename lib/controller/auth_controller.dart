import 'package:flutter/material.dart';
import 'package:notes_app/service/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  signUp(String email, String password) async {
    return _authService.signUp(email, password);
  }

  signIn(String email, String password) async {
    return _authService.signIn(email, password);
  }
}

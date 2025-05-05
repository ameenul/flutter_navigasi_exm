import 'package:flutter/material.dart';
import '../../domain/usecases/auth/login_user.dart';
import '../../domain/usecases/auth/register_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository repository;
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthProvider({
    required this.repository,
    required this.loginUser,
    required this.registerUser,
  });

  bool get isLoggedIn => repository.currentUser != null;

  bool login(String username, String password) {
    final success = loginUser(username, password);
    if (success) notifyListeners();
    return success;
  }

  bool register(String username, String password) {
    final success = registerUser(username, password);
    return success;
  }

  void logout() {
    repository.logout();
    notifyListeners();
  }
}
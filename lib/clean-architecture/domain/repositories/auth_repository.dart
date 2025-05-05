import '../entities/user.dart';

abstract class AuthRepository {
  User? get currentUser;
  bool login(String username, String password);
  bool register(String username, String password);
  void logout();
}
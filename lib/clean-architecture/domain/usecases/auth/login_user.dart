import '../../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;
  LoginUser(this.repository);
  bool call(String username, String password) => repository.login(username, password);
}
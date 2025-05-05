import '../../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;
  RegisterUser(this.repository);
  bool call(String username, String password) => repository.register(username, password);
}
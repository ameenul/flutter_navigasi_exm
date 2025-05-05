import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  User? _currentUser;
  final List<User> _users = [];

  @override
  User? get currentUser => _currentUser;

  @override
  bool login(String username, String password) {
    final user = _users.firstWhere(
          (u) => u.username == username && u.password == password,
      orElse: () => User(username: '', password: ''),
    );
    if (user.username.isNotEmpty) {
      _currentUser = user;
      return true;
    }
    return false;
  }

  @override
  bool register(String username, String password) {
    if (_users.any((u) => u.username == username)) return false;
    _users.add(User(username: username, password: password));
    return true;
  }

  @override
  void logout() => _currentUser = null;
}
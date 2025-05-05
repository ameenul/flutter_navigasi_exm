import '../../repositories/cart_repository.dart';

class DecrementItem {
  final CartRepository repository;
  DecrementItem(this.repository);
  void call(String name) => repository.removeOne(name);
}
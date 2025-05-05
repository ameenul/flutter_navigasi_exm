import '../../repositories/cart_repository.dart';

class RemoveItem {
  final CartRepository repository;
  RemoveItem(this.repository);
  void call(String name) => repository.removeItem(name);
}
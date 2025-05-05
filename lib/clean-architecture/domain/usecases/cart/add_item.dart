import '../../repositories/cart_repository.dart';

class AddItem {
  final CartRepository repository;
  AddItem(this.repository);
  void call(String name) => repository.addItem(name);
}
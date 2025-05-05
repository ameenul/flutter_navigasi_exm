import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final Map<String, CartItem> _items = {};

  @override
  Map<String, CartItem> getItems() => _items;

  @override
  void addItem(String name) {
    _items.update(
      name,
          (item) => CartItem(name: name, quantity: item.quantity + 1),
      ifAbsent: () => CartItem(name: name, quantity: 1),
    );
  }

  @override
  void removeOne(String name) {
    final item = _items[name];
    if (item != null) {
      if (item.quantity > 1) {
        _items[name] = CartItem(name: name, quantity: item.quantity - 1);
      } else {
        _items.remove(name);
      }
    }
  }

  @override
  void removeItem(String name) => _items.remove(name);
}

import '../entities/cart_item.dart';

abstract class CartRepository {
  Map<String, CartItem> getItems();
  void addItem(String name);
  void removeOne(String name);
  void removeItem(String name);
}
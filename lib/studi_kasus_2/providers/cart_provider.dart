import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _items = {};

  // Tambahkan ini:
  Map<String, int> get items => _items;

  void addItem(String product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }

  void removeOne(String product) {
    if (!_items.containsKey(product)) return;

    if (_items[product]! > 1) {
      _items[product] = _items[product]! - 1;
    } else {
      _items.remove(product);
    }
    notifyListeners();
  }

  void removeItem(String product) {
    _items.remove(product);
    notifyListeners();
  }

  int get totalItems => _items.values.fold(0, (sum, qty) => sum + qty);
}

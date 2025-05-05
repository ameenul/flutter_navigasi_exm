import 'package:flutter/material.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/usecases/cart/add_item.dart';
import '../../domain/usecases/cart/remove_item.dart';
import '../../domain/usecases/cart/decrement_item.dart';
import '../../domain/repositories/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository repository;
  final AddItem addItemUseCase;
  final RemoveItem removeItemUseCase;
  final DecrementItem decrementItemUseCase;

  CartProvider({
    required this.repository,
    required this.addItemUseCase,
    required this.removeItemUseCase,
    required this.decrementItemUseCase,
  });

  Map<String, CartItem> get items => repository.getItems();

  int get totalItems =>
      repository.getItems().values.fold(0, (sum, item) => sum + item.quantity);


  void addItem(String name) {
    addItemUseCase(name);
    notifyListeners();
  }

  void removeItem(String name) {
    removeItemUseCase(name);
    notifyListeners();
  }

  void decrementItem(String name) {
    decrementItemUseCase(name);
    notifyListeners();
  }
}
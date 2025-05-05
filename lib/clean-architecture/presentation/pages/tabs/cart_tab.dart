import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import 'cart_item_tile.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        final itemKeys = cartProvider.items.keys.toList();

        if (itemKeys.isEmpty) {
          return Center(child: Text("Keranjang kosong"));
        }

        return ListView.builder(
          itemCount: itemKeys.length,
          itemBuilder: (context, index) {
            final productName = itemKeys[index];
            return CartItemTile(productName: productName);
          },
        );
      },
    );
  }
}
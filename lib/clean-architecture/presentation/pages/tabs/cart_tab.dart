import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import 'cart_item_tile.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CartProvider, int>(
      selector: (_, provider) => provider.items.length,
      builder: (context, itemCount, _) {
        if (itemCount == 0) {
          return Center(child: Text("Keranjang kosong"));
        }

        // Ambil itemKeys dari read, supaya tidak trigger rebuild
        final itemKeys = context.read<CartProvider>().items.keys.toList();

        return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            final productName = itemKeys[index];
            return CartItemTile(productName: productName);
          },
        );
      },
    );
  }
}

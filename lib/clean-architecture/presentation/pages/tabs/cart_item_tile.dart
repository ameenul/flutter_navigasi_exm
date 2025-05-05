import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  final String productName;

  const CartItemTile({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Selector<CartProvider, int?>(
      selector: (context, provider) => provider.items[productName]?.quantity,
      builder: (context, quantity, _) {
        if (quantity == null || quantity == 0) {
          return SizedBox.shrink();
        }

        return ListTile(
          title: Text(productName),
          subtitle: Text('Jumlah: $quantity'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => context.read<CartProvider>().decrementItem(productName),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => context.read<CartProvider>().addItem(productName),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => context.read<CartProvider>().removeItem(productName),
              ),
            ],
          ),
        );
      },
    );
  }
}
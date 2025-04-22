import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    if (cart.items.isEmpty) {
      return Center(child: Text("Keranjang kosong"));
    }

    final itemList = cart.items.entries.toList();

    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final product = itemList[index].key;
        final quantity = itemList[index].value;

        return ListTile(
          title: Text(product),
          subtitle: Text("Jumlah: $quantity"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => cart.removeOne(product),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => cart.addItem(product),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => cart.removeItem(product),
              ),
            ],
          ),
        );
      },
    );
  }
}

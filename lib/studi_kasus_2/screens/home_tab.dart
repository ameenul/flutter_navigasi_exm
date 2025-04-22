import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class HomeTab extends StatelessWidget {
  final List<String> products = ['Apel', 'Jeruk', 'Pisang', 'Mangga'];

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            title: Text(product),
            trailing: ElevatedButton(
              onPressed: () => cart.addItem(product),
              child: Text("Tambah"),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigasi_provider/clean-architecture/presentation/pages/tabs/cart_tab.dart';
import 'package:navigasi_provider/clean-architecture/presentation/pages/tabs/home_tab.dart';
import 'package:navigasi_provider/clean-architecture/presentation/pages/tabs/profile_tab.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/page_provider.dart';
import '../providers/auth_provider.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = context.watch<PageProvider>();
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: PageView(
        controller: pageProvider.controller,
        onPageChanged: pageProvider.onPageChanged,
        children:  [
          HomeTab(),
          CartTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageProvider.currentIndex,
        onTap: pageProvider.setIndex,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartProvider.totalItems > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${cartProvider.totalItems}',
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigasi_provider/studi_kasus_2/screens/profile_tab.dart';
import 'package:provider/provider.dart';
import '../providers/page_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import 'cart_tab.dart';
import 'home_tab.dart';


class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: context.read<PageProvider>().currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    context.read<PageProvider>().setIndex(index);
  }

  void _onTapNavBar(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = context.watch<PageProvider>().currentIndex;
    final cartCount = context.watch<CartProvider>().items.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeTab(),
          CartTab(),    // ⬅️ Tambahkan ini
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: _onTapNavBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (cartCount > 0)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '$cartCount',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

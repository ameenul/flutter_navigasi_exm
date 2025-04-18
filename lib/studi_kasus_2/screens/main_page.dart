import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/page_provider.dart';
import '../providers/auth_provider.dart';
import 'home_tab.dart';
import 'profile_tab.dart';

class MainPage extends StatelessWidget {
  final List<Widget> pages = [HomeTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Nav App"),
        actions: [
          IconButton(
            onPressed: () {
              auth.logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: pages[pageProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageProvider.currentIndex,
        onTap: (index) => pageProvider.setIndex(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

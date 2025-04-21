import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/page_provider.dart';
import '../providers/auth_provider.dart';
import 'home_tab.dart';
import 'profile_tab.dart';

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
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: _onTapNavBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}


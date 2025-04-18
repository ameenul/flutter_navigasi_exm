import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Consumer<AuthProvider>(
            builder: (context, auth, _) => IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                auth.logout();
                Navigator.pushReplacementNamed(context, '/'); //coba Navigator.pushNamed(context, '/'); apa bedanya
              },
            ),
          )
        ],
      ),
      body: Center(child: Text("Selamat datang!")),
    );
  }
}

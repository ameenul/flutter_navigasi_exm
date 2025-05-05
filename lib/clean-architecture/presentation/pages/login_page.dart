import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Consumer<AuthProvider>(
              builder: (context, auth, _) => ElevatedButton(
                onPressed: () {
                  final success = auth.login(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Navigator.pushReplacementNamed(context, '/main');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login gagal")),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: Text("Belum punya akun? Register"),
            )
          ],
        ),
      ),
    );
  }
}
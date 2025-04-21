import 'package:flutter/material.dart';
import 'package:navigasi_provider/studi_kasus_2/providers/cart_provider.dart';
import 'package:navigasi_provider/studi_kasus_2/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/page_provider.dart';
import 'screens/login_page.dart';
import 'screens/main_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/main': (context) => MainPage(),
          },
        );
      },
    );
  }
}




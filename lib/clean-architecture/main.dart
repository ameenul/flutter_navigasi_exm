import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/auth_repository.impl.dart';
import 'data/repositories/cart_repository.impl.dart';
import 'domain/usecases/cart/add_item.dart';
import 'domain/usecases/cart/remove_item.dart';
import 'domain/usecases/cart/decrement_item.dart';
import 'domain/usecases/auth/login_user.dart';
import 'domain/usecases/auth/register_user.dart';
import 'presentation/providers/cart_provider.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/page_provider.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/pages/main_page.dart';

void main() {
  final cartRepository = CartRepositoryImpl();
  final authRepository = AuthRepositoryImpl();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(
            repository: cartRepository,
            addItemUseCase: AddItem(cartRepository),
            removeItemUseCase: RemoveItem(cartRepository),
            decrementItemUseCase: DecrementItem(cartRepository),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            repository: authRepository,
            loginUser: LoginUser(authRepository),
            registerUser: RegisterUser(authRepository),
          ),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
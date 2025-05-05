import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dark Mode"),
              Switch(
                value: isDarkMode,
                onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
              )
            ],
          )
        ],
      ),
    );
  }
}
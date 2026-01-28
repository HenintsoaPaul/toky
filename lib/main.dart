import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/prompts/screens/input_screen.dart';

void main() {
  runApp(const ProviderScope(child: TokyApp()));
}

class TokyApp extends StatelessWidget {
  const TokyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toky',
      theme: AppTheme.lightTheme,
      home: const InputScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

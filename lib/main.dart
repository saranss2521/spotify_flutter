import 'package:flutter/material.dart';
import 'screens/welcome_modern_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SARAN',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1ED760),
      ),
      home: const WelcomeModernScreen(),
    );
  }
}

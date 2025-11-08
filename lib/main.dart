import 'package:flutter/material.dart';
import 'package:the_12th_kit/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brandNavy    = Color(0xFF0A192F);
    const brandAccent  = Color(0xFF00FF88);
    const brandSurface = Color(0xFFFFFFFF);
    const brandMuted   = Color(0xFFF3F4F6);
    const navbar       = Color(0xFF081A33);

    final scheme = ColorScheme.fromSeed(
      seedColor: brandNavy,
      brightness: Brightness.light,
    ).copyWith(
      primary: brandNavy,
      secondary: brandAccent,
      surface: brandSurface,
    );

    return MaterialApp(
      title: 'The 12th Kit',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: brandMuted,
        appBarTheme: const AppBarTheme(
          backgroundColor: navbar,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

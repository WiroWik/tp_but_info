import 'package:flutter/material.dart';
import 'package:tp_but_info/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF663399),
          foregroundColor: Colors.white,
        )
      ),
    );
  }
}

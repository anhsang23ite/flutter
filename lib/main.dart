import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const FlutterLabsApp());
}

class FlutterLabsApp extends StatelessWidget {
  const FlutterLabsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '📚 Flutter Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2196F3),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const MenuScreen(),
    );
  }
}
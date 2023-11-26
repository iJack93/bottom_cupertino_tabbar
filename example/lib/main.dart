import 'package:bottom_cupertino_tabbar_example/main_page.dart';
import 'package:bottom_cupertino_tabbar_example/simple_tabbar.dart';
import 'package:bottom_cupertino_tabbar_example/tabbar_with_centered_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Cupertino TabBar Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

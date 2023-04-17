import 'package:flutter/material.dart';

import 'app/view/home_app.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:Colors.amberAccent,
        brightness: Brightness.dark),
        home: const HomeApp(),
    );
  }
}

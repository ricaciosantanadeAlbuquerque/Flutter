
import 'package:flutter/material.dart';
import 'package:lista/home_page.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.green,
      ),
      home: const HomePage()
    );
  }
}

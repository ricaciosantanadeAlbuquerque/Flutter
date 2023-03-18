
import 'package:flutter/material.dart';
import 'src/home_app.dart';


void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {

  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:ThemeData(
          primarySwatch:Colors.red,
        ),
        home:  const HomeApp()
    );
  }
}

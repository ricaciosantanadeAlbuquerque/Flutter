import 'package:flutter/material.dart';
import 'package:tela_login_navegacao/login.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme:ThemeData(
            primarySwatch:Colors.red
          ),
        home: const HomeApp()
    );
  }
}

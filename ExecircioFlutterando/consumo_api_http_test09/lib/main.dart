import 'package:consumo_api_http_test09/src/view/home_meu_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:ThemeData(
          primarySwatch: Colors.red
        ),
        home: const HomeApp(),
    );
  }
}

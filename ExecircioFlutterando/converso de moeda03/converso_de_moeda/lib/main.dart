import 'package:converso_de_moeda/app/view/Home_App.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      brightness:Brightness.dark
      ),
      home: HomeApp(),
    );
  }
}

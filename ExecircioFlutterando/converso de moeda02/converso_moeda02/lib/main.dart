import 'package:converso_moeda02/App/view/Home_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark(),
      home:HomeView()
    );
  }
}

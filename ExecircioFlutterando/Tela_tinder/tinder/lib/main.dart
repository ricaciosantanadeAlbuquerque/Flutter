import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/home_page.dart';

void main() {
  runApp(const Tinder());
}

class Tinder extends StatelessWidget {
  const Tinder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage()
    );
  }
}


import 'package:flutter/material.dart';
import 'package:tinder/inico.dart';

void main() {
  runApp(const Tinder());
}

class Tinder extends StatelessWidget {
  //todas as classes abstratas são como interfaces por isso é necessário implementar seus métodos
  const Tinder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home: const Inicio()
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/inicio.dart';

void main(List<String> args) {
  runApp(const MeuApp());
}

// classe sem estado

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor:  Colors.greenAccent
      ),
      home: const Inicio()
    );
  }
}

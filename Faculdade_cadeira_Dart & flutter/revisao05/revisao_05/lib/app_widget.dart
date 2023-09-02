import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
class MeuApp extends StatelessWidget{
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context){ // o que não vai mudar fica nas classes StatelessWidget o que muda vai para Statefulwidget
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.green
      ),
      home: const PaginaInicial()
    );
  }
}
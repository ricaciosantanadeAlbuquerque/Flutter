import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/inicio.dart';
import 'package:timeago/timeago.dart' as timeago;
void main(List<String> args)async {
  final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));

  print(timeago.format(fifteenAgo)); // 15 minutes ago
  print(timeago.format(fifteenAgo, locale: 'en_short')); // 15m
  print(timeago.format(fifteenAgo, locale: 'es')); // h
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/inicio.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:whatsapp/tela_lista.dart';

void main(List<String> args) async {
  timeago.setLocaleMessages('pt_br', timeago.PtBrShortMessages());
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
        accentColor: Colors.greenAccent),
        initialRoute:"/",
        routes:{"/":(context)=> const Inicio(),
                "p":(context)=>   Lista()}
    );
  }
}

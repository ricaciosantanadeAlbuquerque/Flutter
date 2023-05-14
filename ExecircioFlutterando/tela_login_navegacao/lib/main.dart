import 'package:flutter/material.dart';
import 'package:tela_login_navegacao/login.dart';
import 'package:tela_login_navegacao/segunda_tela.dart';

import 'controle.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Controle.instancia, 
      builder: (BuildContext context, Widget? child) { 
        return  MaterialApp(
          theme:ThemeData(
            primarySwatch:Colors.red,
            brightness:Controle.instancia.valor ? Brightness.dark :Brightness.light
          ),
        home: const HomeApp()
    );
       }
      
       
 );
  }
}

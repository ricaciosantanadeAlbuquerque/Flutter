import 'package:flutter/material.dart';
import 'package:tela_widget/controle_Singleton.dart';
import 'package:tela_widget/home_app.dart';


void main() {
  runApp( const MeuApp());
}

class MeuApp extends StatelessWidget {
   const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: Controle.controle, builder:(context,widget){
       return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.red,
             brightness: (Controle.controle.mudar)? Brightness.dark : Brightness.light),

            home: const HomeApp(),
          );
    });
  }
}

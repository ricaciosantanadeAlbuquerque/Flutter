//======================================== Estado ===============================================================================
import 'package:exercitando/home_page.dart';
import 'package:exercitando/segunda_tela.dart';
import 'package:exercitando/singleton.dart';
import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Singleton.instancia,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Singleton.instancia.logico ? Brightness.dark : Brightness.light,
        ),
        initialRoute:"/",
        routes:{
          "/":(context) => const HomePage(), // deve ser um const pois é página estática
          "tela2":(context) => Tela2()
        }
        
        );
      },
    );
  }
}

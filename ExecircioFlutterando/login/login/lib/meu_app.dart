import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/home_page.dart';
import 'package:login/tela_2.dart';

import 'controle.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:Controle.instancia,
      builder: (BuildContext context, Widget? child) {  
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness:Controle.instancia.verdade ? Brightness.dark : Brightness.light
          ),
          initialRoute: "/",
          routes:{
            "/":(context) => const Gerente(),
            "tela2":(context) => const Tela()

          }
        );
      },);
  }
}

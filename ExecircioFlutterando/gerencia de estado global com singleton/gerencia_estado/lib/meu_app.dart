
import 'package:flutter/material.dart';
import 'package:gerencia_estado/home_page.dart';

import 'controller.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:Controle.instancia, // é necessário usar a instâcia para acessar aclasse
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness:Controle.instancia.mudar ? Brightness.dark : Brightness.light,
            ), 
          home: const Gerencia()
          );
      },
    );
  }
}

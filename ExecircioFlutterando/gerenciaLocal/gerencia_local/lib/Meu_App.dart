import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Gerencia.dart';

class MeuApp extends StatelessWidget {
  // classe estática sem alteração

 

  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      home:  const PaginaPrincipal()
    );
  }
}

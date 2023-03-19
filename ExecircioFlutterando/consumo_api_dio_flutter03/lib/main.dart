import 'package:consumo_api_dio_flutter03/src/home_app.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( const Aplicativo());
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.amber
      ),
      home: const Inicio()
    );
  }
}

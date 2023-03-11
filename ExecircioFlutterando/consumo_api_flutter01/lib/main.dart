import 'package:consumo_api_flutter01/Home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {

  const MeuApp({super.key});


  @override
  Widget build(BuildContext conetxt) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:  Colors.green,
        brightness: Brightness.light,
      ),
      home:HomePage()
    );
  }
}



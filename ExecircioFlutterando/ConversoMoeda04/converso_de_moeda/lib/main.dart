import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Aplicativo/view/Home_App.dart';

void main() {
  
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: HomeApp());
  }
}

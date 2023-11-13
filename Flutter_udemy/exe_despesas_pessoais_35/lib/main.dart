import 'package:exe_despesas_pessoais_35/view/my_home_app.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData().copyWith(
        colorScheme:ThemeData().colorScheme.copyWith(
          primary: Colors.purple,
          secondary:Colors.amberAccent,
        ),
        textTheme:ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize:16,
            fontWeight:FontWeight.bold,
            color:Colors.black,
            fontFamily: 'BarlowCondensed',
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle:  TextStyle(
            fontSize:25,
            fontWeight:FontWeight.bold,
            fontFamily:'EBGaramond'
          )
        ),
      ),
      home: const MyHomeApp(),
    );
  }
}


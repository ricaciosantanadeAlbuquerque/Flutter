
import 'package:flutter/material.dart';
import 'view/home_page.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme:ThemeData().colorScheme.copyWith(
          primary:Colors.purple,
          secondary:Colors.amberAccent
        ),
        textTheme:ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize:16,
            fontWeight:FontWeight.bold,
            color:Colors.black,
            fontFamily:'Quicksand'
          ),
          labelLarge: const TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color:Colors.white,

          ),
        )
        ,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize:25,
            fontWeight:FontWeight.bold,
            fontFamily:'PlayfairDisplay'
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}



import 'package:exe_responsivo11/view/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.amberAccent,
              ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Nunito'),
                labelLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Nunito'),
              ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 25 * MediaQuery.of(context).textScaleFactor
              , fontWeight: FontWeight.bold, fontFamily: 'AlexBrush'),
          ),
        ),
        home: const MyHomePage());
  }
}

import 'package:flutter/material.dart';

void main() => runApp( const ExpensesApp());

class ExpensesApp extends StatelessWidget { // classe imutável
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {  // classe imutável
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Despesas Pessoais')
      ),
      body:const Center(
        child:  Text("Versão inicial")
      )
    );
  }
}

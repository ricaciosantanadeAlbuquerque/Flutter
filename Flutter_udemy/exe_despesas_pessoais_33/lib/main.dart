import 'package:flutter/material.dart';

void main() {}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme:ThemeData().colorScheme.copyWith(
          primary:Colors.purple,
          secondary:Colors.amberAccent,
        ),
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: const Column(
        children:[
          Card(
            elevation:5,
            color:Colors.blue,
            child: Text('Gráfico'),
          ),
          Card(
            elevation:5,
            color:Colors.blue,
            child:Text('Lista'),
          ),
          Card(
            elevation:5,
            color:Colors.blue,
            child: Text('Formulário'),
          ),
        ],
      ),
    );
  }
}

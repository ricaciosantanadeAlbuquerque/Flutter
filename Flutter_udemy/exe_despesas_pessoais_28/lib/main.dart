import 'package:flutter/material.dart';

void main() {}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  HyHomeAppState createState() => HyHomeAppState();
}

class HyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body:Column(
        children:<Widget>[
          Card(
            color:Colors.blue,
            elevation:5,
            child:Text('Gráfico')
          ),
        
        ]
      )
    );
  }
}

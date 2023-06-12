import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
          title:const Text("Despesas Pessoais")
      ),
      body:Column(
          children: <Widget>[
            
              Container(
                width:double.infinity,
                child: const Card(
                  color: Colors.blue,
                  elevation:5,
                  child: Text('Gráfico'),
                ),
              ),
              const Card(
                child: Text('Lista de Transações')
              )
          ]
      )
    );
  }
}
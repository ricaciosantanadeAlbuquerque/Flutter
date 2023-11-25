import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Center(
          child:Text('Despesas Pessoais'),
        ),
      ),
      body: const Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        crossAxisAlignment:CrossAxisAlignment.stretch,
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
            child: Text('Form'),
          ),
        ],
      ),
    );
  }
}

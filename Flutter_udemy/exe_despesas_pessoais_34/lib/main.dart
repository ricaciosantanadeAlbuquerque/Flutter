import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData().copyWith(
        colorScheme:ThemeData().colorScheme.copyWith(
          primary: Colors.purple,
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
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {

 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Center(
          child: Text('Despesas Pessoais'),
        ),
        actions:[
          IconButton(
            onPressed:(){},
            icon:const Icon(Icons.add),
          ),
        ],
      ),
      body:  const Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          Card(
            elevation:5,
            color:Colors.blue,
            child: Text('Gráfico'),
          ),
          Card(
            elevation: 5,
            color:Colors.blue,
            child: Text('Lista Widget')
          ),
          Card(
            elevation:5,
            color:Colors.blue,
            child:Text('Form'),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){},
        child:const Icon(Icons.add),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
  }
}

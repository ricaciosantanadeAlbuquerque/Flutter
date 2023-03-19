import 'package:flutter/material.dart';

class Inicio extends StatelessWidget{

  const Inicio({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("Lista")
      ),
      body:ListView.builder(
        itemCount:30,
        itemBuilder:(context,index){
          return ListTile(
            title: Text("Item $index")
          );
        }
      )
    );
  }
}
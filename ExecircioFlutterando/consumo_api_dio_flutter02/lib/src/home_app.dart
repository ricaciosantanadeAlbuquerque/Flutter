import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Lista")
      ),
      body:ListView.builder(
        itemCount: 30,
        itemBuilder:(_,index){
          return ListTile(
            title: Text("item $index")
          );
        })
    );
  }
}

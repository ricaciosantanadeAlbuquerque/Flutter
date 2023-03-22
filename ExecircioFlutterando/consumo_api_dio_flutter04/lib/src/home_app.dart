import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {

  const HomeApp({super.key});

  @override
  State<HomeApp> createState() {
    return Estado();
  }
}

class Estado extends State<HomeApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista")
      ),
      body:ListView.builder(
        itemCount:20,
        itemBuilder: (context,index){
          return ListTile(
            title: Text("Item $index ")
          );
        },)
    );
  }
}

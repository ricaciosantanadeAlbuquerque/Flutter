import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  // como a classe  StatelessWidget é uma interface uma classe abstrata é necessário implementar seus métodos
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}

// separação de estado e gerencia

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return EstadoApp();
  }
}

class EstadoApp extends State<StatefulWidget> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: Container(
            child: Center(
              child: GestureDetector(
                  child: Text("Contador  $contador"),
                  onTap: () {
                    setState(() {
                      contador++;
                    });
                  }),
            )
                ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                contador++;
              });
            },
            child: const Icon(Icons.add)));
  }
}

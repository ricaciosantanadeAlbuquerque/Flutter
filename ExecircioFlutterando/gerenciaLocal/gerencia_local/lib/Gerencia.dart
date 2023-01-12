import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  // gerencia o estado
  const PaginaPrincipal({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

// retorna um estado para  PaginaPrincipal

class Estado extends State<StatefulWidget> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(" Página Inicial ", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white, fontSize: 30))),
        body: Container(
            child: Center(
                child: GestureDetector(
                    child: Text("Contando $cont",
                    style:const TextStyle(
                      fontSize:30,
                      color:Colors.green
                    )),
                    onTap: () {
                      setState(() {
                        cont++;
                      });
                    }))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                cont++; // pós incremento
              });
            },
            child: const Icon(Icons.add)
            )
            );
  }
}

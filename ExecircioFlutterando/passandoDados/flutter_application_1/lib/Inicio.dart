import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tela2.dart';

class Inicio extends StatefulWidget {
 const Inicio({super.key});

  @override
  State<Inicio> createState() {
    return Estado();
  }
}

class Estado extends State<Inicio> {

  TextEditingController p =  TextEditingController();
  void salvar(){
    final String nome = p.text;
    setState(() {
        Navigator.push(context,MaterialPageRoute(builder:(context)=> Tela2(nome: nome)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Passando valores entre telas"),
        centerTitle: true
      ),
      body:Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            TextField(
              controller:p,
              decoration:const InputDecoration(
                labelText:"Nome",
                hintText:"Informe seu nome",
                border:OutlineInputBorder()
              )
            ),
            ElevatedButton(onPressed: salvar,
            child: const Text("Salvar ")
            )
          ],
        )
      )
    );
  }
}

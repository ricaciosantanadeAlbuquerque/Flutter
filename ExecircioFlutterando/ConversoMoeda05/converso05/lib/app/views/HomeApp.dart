import 'package:converso05/app/Componentes/linha.dart';
import 'package:converso05/app/controllers/controle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() {
    return Estado();
  }
}

class Estado extends State<HomeApp> {

  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();

  Controle? controle;
  @override
  void initState() {
    super.initState();
    controle = Controle(entrada: entrada, saida: saida);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
              Image.asset("assets/converso.jpg",width:100,height:100),
              const SizedBox(height:20),
              Linha(controller: entrada, lista: controle!.lista!, onChanged:(value){
                setState(() {
                  controle!.de =value;
                });
              }, selecionado: controle!.de!),
              const SizedBox(height: 10,),
              Linha(controller: saida, lista: controle!.lista!, onChanged: (velue){
                setState(() {
                  controle!.para = velue;
                });
              }, selecionado: controle!.para!),
              const SizedBox(height:40),
              ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
                onPressed: () {
                    
                  setState(() {
                    controle!.converte();
                  });
                    
                },
                child: const Text("Converte"),
              )
                  ],
                ),
            ),
          ),
        ));
  }
}

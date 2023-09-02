import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controle.dart';

class Tela2 extends StatefulWidget{
   const Tela2({super.key});
  @override
  State <StatefulWidget> createState(){
    return Estado();
  }
}

class Estado extends State<StatefulWidget>{
  int cont = 0;
  Widget build(BuildContext context){
    return Scaffold(
      drawer:Drawer(
        child: Column(
          children:<Widget>[
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              subtitle:const Text("Tela Inicio"),
              onTap: () {
                print("Vc clicou");
              },
            ),
            ListTile(
              leading:const Icon(Icons.replay),
              title:const Text("Sair"),
              subtitle: const Text("Voltar"),
              onTap:(){
                Navigator.of(context).pushReplacementNamed("/");
              }
            )
          ]
        ),
      ),
      appBar:AppBar(
        title:const Text("Home page"),
        actions:<Widget>[_escolha()]
      ),
      body: _corpo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          setState(() {
            cont++;
          });
         },
        child: const Icon(Icons.add)
        ,)
    );
  }
  // componentizando===============================================================================
  Widget _escolha(){
    return    Switch(
            value: Controle.instancia.verdade,
            onChanged:(value){
              Controle.instancia.troca();
            }
          );
  }
// componentizando===============================================================================
  Widget _corpo(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text("Contador $cont"),
          Container(
            height:10
          ),
          _escolha(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width:100,
                height:100,
                color: Colors.black
              ),
               Container(
                width:100,
                height:100,
                color: Colors.black
              ),
               Container(
                width:100,
                height:100,
                color: Colors.black
              )
            ]
          )
        ]
      );
  }
}
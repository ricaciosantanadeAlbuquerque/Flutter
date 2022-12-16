import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controlle.dart';

class TelaGerenciar extends StatefulWidget {
  const TelaGerenciar({super.key});
  @override
  State<StatefulWidget> createState() {
    return homePageEstado();
  }
}

// ignore: camel_case_types
class homePageEstado extends State<StatefulWidget> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
            child: Text("Home Page")
        )
      ),
      body:Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  GestureDetector(
                    child: Text("Contador $contador"),
                    onTap:(){
                      setState((){
                        contador++;
                      });
                    }
                    ),
                    Container(
                      child: Switch(
                      value: Controle.instancia.troca,
                      onChanged:(valeu){
                        setState((){
                          Controle.instancia.trocarValor();
                        });
                      }
                      )
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Container(
                          width: 50,
                          height:50,
                          color: Colors.black
                        ),
                        Container(
                           width: 50, height: 50, color: Colors.black
                        ),
                        Container(
                           width: 50, height: 50, color: Colors.black
                        )
                      ]
                    )
              ]
            ),
          )
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState((){
            contador++;
          });
        },
        child: const Icon(Icons.add)
        )
    );
  }
}



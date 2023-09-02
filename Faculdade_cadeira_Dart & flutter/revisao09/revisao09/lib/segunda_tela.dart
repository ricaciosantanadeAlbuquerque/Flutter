import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controle.dart';

class Tela2 extends StatefulWidget{
  const Tela2({super.key});
 State<StatefulWidget> createState(){
  return  Estado();
 }
}
//=======================================================================================================================================
class Estado extends State<StatefulWidget>{
Widget build(BuildContext context){
  return Scaffold(
    drawer:Drawer(
      child:Column(
        children: [
          ListTile(
            leading:const Icon(Icons.home),
            title: const Text("Inicio"),
            subtitle: const Text("tela Inicio"),
            onTap:(){
              print("Clicado");
            }
          ),
           ListTile(
            leading: const Icon(Icons.home),
            title:const Text("sair"),
            subtitle: const Text("Finalizar sesão"),
           onTap: () {
             Navigator.of(context).pushReplacementNamed("/");
           },
          )
        ],
      )
    ),
    appBar: AppBar(
      title: const Center(
        child:  Text("Menu"),
      ),
      actions: const [MudancaTela()],
    ),
    body:SingleChildScrollView(
      child: Center(
        child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              ),
              Container(
                height:10
              ),
               Container(
                width:200,
                height:200,
                color:Colors.red
              )
    
            ],
          )
        ),
      ),
    )
  );
}
}
//======================================================================================================================

class MudancaTela extends StatelessWidget{
  const MudancaTela({super.key});
  @override
  Widget build(BuildContext context){
    return Switch(
      value:Controle.instancia.logica,
       onChanged:(value){
          Controle.instancia.trocar();
       });
  }
}
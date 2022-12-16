import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget{ // gerencia um estado ============================================================================
  const Inicio({super.key});
   @override
  State <StatefulWidget> createState(){
    return Estado();
  }
}

// estado ==============================================================================================================================

class Estado extends State<StatefulWidget>{ // cria e retorna um estado 
  @override
 Widget build(BuildContext context){
  return Scaffold(
    drawer:Drawer(
      child:Column(
        children:  <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("assets/p.jpg")),
            accountName: const Text("Crock"), 
            accountEmail: const Text("Crock@")),

          ListTile(
            leading:const Icon(Icons.home),
            title:const Text("Incio"),
            subtitle:const Text("Tela_Inicio"),
            onTap:(){}
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title:const Text("Sair"),
            subtitle: const Text("voltar"),
            onTap:(){
              
            }
          ),
          ListTile(
            leading: Icon(Icons.replay),
           
          ),
          ListTile(
            leading:Icon(Icons.access_alarm_rounded)
          )
        ]
      )
    ),
    appBar: AppBar(
      title:const Text("Menu_App"),
      actions:const <Widget>[Icon(Icons.add),Icon(Icons.home),Icon(Icons.replay),Icon(Icons.airplanemode_active)]
    ),
    body: Stack(
       children: <Widget>[
        Container(
          color: Color.fromARGB(255, 192, 243, 176)
        )
       ]
    ),
    floatingActionButton:FloatingActionButton(onPressed: () {  },child: const Icon(Icons.add))
  );
 }

}
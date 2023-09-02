
import 'package:flutter/material.dart';
import 'package:revisao09/controle.dart';
import 'package:revisao09/segunda_tela.dart';

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: Controle.instancia,
      builder: (BuildContext context, Widget? child) { 
      return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.red,
        brightness:Controle.instancia.logica ? Brightness.dark : Brightness.light
      ),
      initialRoute: "/",
      routes:{
       "/":(context) =>  Inicial(),
       "rota2":(context) => Tela2()
      }
    );
     },);
  }
}


class Inicial extends StatefulWidget{
  const Inicial({super.key});
  @override
  State<StatefulWidget>createState(){
      return  Estado();
  }
}

class Estado extends State<StatefulWidget>{
    String nome = "";
    String senha = "";
   Widget _corpo(){ // método +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    return Container(
      padding:const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            width:200,
            height:200,
            child: Image.asset("assets/logo.png")
          ),
          Container(
            height:50
          ),
          
          Card(
            child: Column(
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
              onChanged:(text){
                  nome = text;
              },
              keyboardType: TextInputType.name,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "nome"
              )
          ),
            ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText:true,
              onChanged:(text){
                  senha = text;
              },
              decoration:const InputDecoration(
                border:OutlineInputBorder(),
                labelText:"senha",
                
              )
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left:8,right:8,top:0,bottom: 8),
            child: ElevatedButton(
              
              onPressed: (){
              if(senha == "b" && nome == "a"){
                  Navigator.of(context).pushReplacementNamed("rota2");
               }else{
                print("Senha errada");
               }
              }
            , child: const Text("Entrar")
            ),
          ),
              ]
            ),
          ),
        
         
          
        
        ]
      ),
    );
   }
   //====================================================================================================================================
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
            height:MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/fundo3.png",
                fit:BoxFit.cover)
                ),
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              _corpo(),
          ]
        ),
      )
    );
  }
}
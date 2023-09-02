
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget{
  const Inicio({super.key});
  @override
 State<StatefulWidget> createState(){
  return Estado();
  }
}
//================================================================
class Estado extends State<StatefulWidget>{

  
   String nome = "";
   String senha = "";

  Widget _corpo(){ // método corpo ==============================
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SizedBox(
               
              height:150,
              width:200,
                  child: Image.asset("assets/up.png")
                  ),
           ),
        Card(
          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
             
                TextField(
            onChanged:(text){
                nome = text;
            },
            keyboardType: TextInputType.emailAddress,
            decoration:const InputDecoration(
              border:OutlineInputBorder(),
              labelText: "nome"
            )
        ),
        Container(
            height:10
        ),
        TextField(
            onChanged:(text){
                senha = text;
            },
            obscureText: true,
            decoration: const InputDecoration(
              border:OutlineInputBorder(),
              labelText:"Senha"
            )
        ),
        const SizedBox(
            height:10
        ),
        ElevatedButton(
            onPressed:(){
              if(nome == "rick" && senha == "12"){
               Navigator.of(context).pushReplacementNamed("tela2");
              }else{
                print("Senha inválida");
              }
            },
            child: const Text("Entrar"))
              ]
            ),
          )
        )
      ]
    );
  }
  // Método ==== Criação================================
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            width:MediaQuery.of(context).size.height,
            child: Image.asset("assets/plano.png",fit:BoxFit.cover)),
           _corpo()
        ]
      )
    );
  }
}
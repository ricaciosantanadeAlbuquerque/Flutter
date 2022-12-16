import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao08/controle.dart';
import 'package:revisao08/login.dart';

class TelaCadastro extends StatefulWidget{
  
  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
 String login = "";
 String senha = "";

@override
  Widget build(BuildContext context){
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.red
      ),
      home: Scaffold(
        body: Container(
          child:Container(
             width: double.infinity,
             height: double.infinity,
            child: Column(
              children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        login = text;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:"login"
                      ),
                    
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                      senha = text;
                      },
                      decoration: const InputDecoration(
                        border:OutlineInputBorder(),
                        labelText:"Senha"
                      )
                    ),    
                  ),
               
             
                ElevatedButton(onPressed: (){
                  Login.instancia.setEmail = login;
                  Login.instancia.setEmail = senha;
                }, child: const Text(" Cadastrar"))
              ],
            ),
          )
        ),
      )
    );
}
}
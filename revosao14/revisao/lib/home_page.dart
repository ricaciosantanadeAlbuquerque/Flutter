import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
 const Home({super.key});
 @override
 State<StatefulWidget> createState(){
  return Estado();
}
}

class Estado extends State<StatefulWidget>{

  String nome = "";
  String senha = "";

  Widget _corpo(){
      return Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(

            width:200,
            height:100,
            child: Image.asset("assets/up.png"),
          ),
          Container(
            height:10
          ),
          Card(
        
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        TextField(
                          onChanged:(text){
                              nome = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:"nome"
                          )
                        ),
                        Container(
                          height:10
                        ),
                        TextField(
                          onChanged:(text){
                            senha = text;
                          },
                          obscureText:true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:"Senha"
                          )

                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:(){
                              if( nome == "r" && senha == "1"){
                                Navigator.of(context).pushNamed("tela2");
                              }else{
                                print("Senha Inválida ");
                              }
                            },
                            child:const Text("Entrar")
                            )
                            )
                      ]
                    ),
                  )
          ),
        ],
      );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.height,
            child: Image.asset("assets/plano.png",fit:BoxFit.cover)
          ),
          _corpo()
        ]
      )
    );
  }
}
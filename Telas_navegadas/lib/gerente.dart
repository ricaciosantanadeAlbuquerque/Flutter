
import 'package:flutter/material.dart';
import 'package:login/segunda_tela.dart';

class Gerente extends StatefulWidget {
  const Gerente({super.key});
  @override
  State<StatefulWidget> createState() {
    return EstadoPagina();
  }
}
//==================================Estado=========================================================================================
class EstadoPagina extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height, 
         child: Image.asset("assets/fundo.png", fit: BoxFit.cover)
      ),
      Corpo()
      ]
      )
      );
  }
}
//===============================================CORPO============================================================================
class Corpo extends StatelessWidget {
  String login = "";
  String senha = "";

  Corpo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          SizedBox(
            width:100,
            height:100,
            child:Image.asset("assets/logo.png")
          ),
          Container(height:10),
          Container(
            child:Card(
              child:Column(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      
                      onChanged:(value){
                        login = value;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText:"Login",
                        border:OutlineInputBorder()
                      )
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged:(value){
                        senha = value;
                      },
                      obscureText:true,
                      decoration:const InputDecoration(
                       labelText:"Senha",
                       border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed:(){
                        if(login == "1" && senha == "2"){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context){
                              return const TelaGerenciar();
                            })
                          );
                        }
                      },
                      child:Container(
                        child: const Center(
                          child:  Text("Entrar")
                          )
                      )
                    ),
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}

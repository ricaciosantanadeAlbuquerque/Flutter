import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao08/cadastro.dart';
import 'package:revisao08/login.dart';
import 'login.dart';
import 'controle.dart';

class InicialApp extends StatefulWidget{

  const InicialApp({super.key,});
  @override
    State<StatefulWidget> createState(){
      return Estado();
  }
}

class Estado extends State<StatefulWidget>{
  String login = "";
  String senha = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        title: const Center(
          child: Text("Menu !"),
        ),
        actions: const [Escolha(),Cadastro()],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/login2.jpg"),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                    onChanged: (text){
                        login = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "login",
                    
                    )
                ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged:(text){
                        senha = text;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "senha"
                    )
                  ),
                ),
                Container(
                  width:   100,
                  height:40,
                  child: ElevatedButton(onPressed: (){
                  print( Login.instancia.getEmail);
                  print("\n");
                  print(login);

                  if(Login.instancia.getEmail == login){
                    print(" é  igual pode salvar ");
                  }

                  }, child: const Text("Entrar! ")),
                )
              ]
            )
        ),
      ),
      
    );
  
  }

}
// Componentização ====================================================================================================================
class Escolha extends StatelessWidget{
   const Escolha({super.key});
  @override
   Widget build(BuildContext context){
    return Switch(
          value:Controle.instancia.verdade,
           onChanged: (valeu){
            Controle.instancia.trocaLogica();
           }
           );
   }
}

// cadastro =============================================================================================================================

class Cadastro extends StatelessWidget{
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context){
   return ElevatedButton(onPressed: (){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
         return   TelaCadastro();
         })
    );
   }, child: const Text("Cadastrar"));
  }
}
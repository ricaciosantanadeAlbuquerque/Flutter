
import 'package:flutter/material.dart';

class MostraDados extends StatefulWidget {
  TextEditingController? nome;
  TextEditingController? email;
  TextEditingController? senha;

  MostraDados({super.key, this.nome,this.email,this.senha});

  @override
  State<MostraDados> createState() {
    return Estado();
  }
}

class Estado extends State<MostraDados> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
              Card(
                color: Color.fromARGB(255, 112, 112, 110),
                child: Row(
                  
                  children: <Widget>[
                    const Text("Nome: "),
                     Text(widget.nome!.text), 
              ],
                ),
                
              ),
              const SizedBox(height: 20,),
              Card(
                 color: Color.fromARGB(255, 112, 112, 110),
                child: Row(children: [
                  const Text("Email: "),
                    Text(widget.email!.text),
                ],),
              ),
              const SizedBox(height: 20,),
              Card(
                 color: Color.fromARGB(255, 112, 112, 110),
                child: Row(children: [
                         const Text("Senha: "), 
                         Text(widget.senha!.text)
                ],),
              )
            ]),
          )),
    );
  }
}

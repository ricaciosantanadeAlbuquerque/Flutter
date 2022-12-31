import 'package:facebook/Modelo/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostraDados extends StatefulWidget {

  const MostraDados({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<MostraDados> {
  Usuario? usuario = Usuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[const Text("Nome:"), Text(usuario!.getNome), const Text("Email"), Text(usuario!.getEmail), const Text("Senha"), Text(usuario!.getSenha)],
            )
          ])),
    );
  }
}

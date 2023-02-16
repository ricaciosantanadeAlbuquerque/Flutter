import 'package:facebook/Modelo/usuario.dart';
import 'package:flutter/material.dart';

import 'mostrar_dados.dart';

class Inicio extends StatefulWidget {
  TextEditingController? senha;
  TextEditingController? email;
  TextEditingController? nome;
  Usuario? use;

  Inicio({super.key, this.senha, this.email, this.nome});
  @override
  State<Inicio> createState() {
    // implementamos o método createState() pertencente a classe StatefulWidget
    return Estado();
  }
}

// estado gerenciavel ===========================

class Estado extends State<Inicio> {
  // criamos a calsse estado que extende da classe State<> que é do

  String? email;
  String? senha;

  bool verdade = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: <Widget>[
        Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, color: const Color.fromARGB(255, 12, 49, 196)),
        Container(
          child: Column(
            children: [
              Container(
                // primeiro elemento  da coluna ===================
                margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: const Center(child: Text("facebook", style: TextStyle(color: Colors.white, fontSize: 50, fontFamily: "Roboto-Bold"))),
              ),
              Container(
                  child: Column(children: <Widget>[
                const SizedBox(height: 50),
                Container(
                  width: 370,
                  child: TextField(
                      onChanged: (text) {
                        email = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email), border: OutlineInputBorder(), labelText: "Email", hintText: "name@gmail.com", fillColor: Colors.white, filled: true // Para que a cor de fundo seja ativada é necessário filled: true
                          )),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 370,
                  child: TextField(
                      onChanged: (text) {
                        senha = text;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(), hintText: "Senha", fillColor: Colors.white, filled: true, suffixIcon: IconButton(onPressed: () {}, icon: verdade ? Icon(Icons.visibility_off) : Icon(Icons.visibility)))),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 370,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 5, 1, 215)),
                      onPressed: () {
                        setState(() {
                        
                          if (widget.email!.text == email && widget.senha!.text == senha) {
                            //print("========PARABÉNS=============");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => MostraDados(
                                      nome: widget.nome,
                                      email: widget.email,
                                      senha: widget.senha,
                                    ))));
                          } else {
                            print("ERRO!=====================");
                          }
                        });
                      },
                      icon: Icon(Icons.login),
                      label: Text("Login")),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Center(
                    child: GestureDetector(
                        child: const Text("Registrar-se no Facebook", style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "")),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushReplacementNamed("cadastro");
                          });
                        }),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    width: 40,
                    height: 40,
                    child: Card(
                      child: Image.asset(
                        "assets/icon/questao.png",
                        color: const Color.fromARGB(255, 1, 17, 192),
                      ),
                    ))
              ]))
            ],
          ),
        )
      ]),
    ));
  }
}

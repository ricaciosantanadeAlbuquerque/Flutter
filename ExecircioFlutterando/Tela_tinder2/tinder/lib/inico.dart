import 'package:flutter/material.dart';
import 'package:tinder/Tela.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<Inicio> createState() {
    return Estado();
  }
}

//===================================== Estado ====================================

class Estado extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, color: const Color.fromARGB(255, 228, 5, 46)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 80, height: 80, child: Image.asset("assets/imagem/tinder.png", color: Colors.white)),
                      Container(height: 3),
                      const Text("tinder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontFamily: "Nunito-ExtraBold",
                          )),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    width: 320,
                    child: const Text(
                        "Ao tocar em entrar, você concorde com os nossos Termos."
                        "Saiba como processamos seus dados em nossa Política de privacidade e Politica de cookies.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white))),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 220,
                  color: Color.fromARGB(255, 163, 13, 2),
                  child: Card(
                      color: Color.fromARGB(255, 228, 5, 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ListTile(
                                title: const Center(child: Text("ENTRAR COM O GOOGLE")),
                                leading: Container(width: 23, height: 23, child: Image.asset("assets/imagem/google.png")),
                                onTap: () {},
                              )),
                          Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              child: ListTile(
                                title: const Center(child: Text("ENTRAR COM FACEBOOK")),
                                leading: Container(width: 23, height: 23, child: Image.asset("assets/imagem/facebook.png")),
                                onTap: () {},
                              )),
                          Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              child: ListTile(
                                title: const Text("ENTRAR COM NÚMERO DE TELEFONE"),
                                leading: Container(
                                    width: 23,
                                    height: 23,
                                    child: Image.asset(
                                      "assets/imagem/bolha-de-bate-papo.png",
                                    )),
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Tela()));
                                  });
                                },
                              )),
                        ],
                      )),
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Center(
                        child: GestureDetector(
                            child: const Text(
                              "problemas para fazer login ?",
                              style: TextStyle(fontFamily: "Nunito-ExtraBold", color: Colors.white),
                            ),
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(title: Text("Não tem senha !"), actions: <Widget>[
                                        Container(
                                            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text("ok!"))
                                        ]))
                                      ]);
                                    });
                              });
                            }))),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeTela2();
  }
}

class HomeTela2 extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/imagem/tinder.png",
                  color: const Color.fromARGB(255, 228, 5, 46),
                )),
            Container(child: const ListTile(title: Center(child: Text("Bem-Vindo(a) ao Tinder.")), subtitle: Center(child: Text("Siga as regras da casa")))),
            Container(
                child: ListTile(
              title: const Text("Seja você mesmo."),
              leading: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.check_box_outline_blank)),
            )),
            Container(
                child: const ListTile(
              subtitle: Center(child: Text("Certifique-se de que suas fotos, idade e descrição sejam verdadeiras.")),
            )),
            Container(
                child: ListTile(
                    title: const Text("Proteja-se."),
                    leading: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: const Icon(Icons.check_box_outline_blank)))),
            Container(
                child: const ListTile(
              subtitle: Text("Não forneça informações pessoais rápido de mais. Encontros com segurança"),
            )),
            Container(child: ListTile(leading: IconButton(onPressed: () {}, icon: Icon(Icons.check_box_outline_blank)), title: const Text("Seja legal."))),
            Container(
                child: const ListTile(
              subtitle: Text("Respeite os outros e os trate como você gostaria de ser tratado."),
            )),
            Container(
                child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.check_box_outline_blank),
                    ),
                    title: const Text("Seja pró-ativo."),
                    subtitle: const Text("Sempre denuncie mau comportamento."),
                  ),
                ),
              ],
            )),
            Container(
              padding: const EdgeInsets.all(10),
               width: 405,
              height: 80,
              color: Color.fromARGB(255, 246, 0, 0),
              child: Container(
                padding: const EdgeInsets.all(3),
                  width: 405,
                  height: 65,
                  color: Colors.white,
                  child: Card(
                      color: const Color.fromARGB(255, 228, 5, 46),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        child: const Center(child:  Text("EU ACEITO",
                        style:TextStyle(
                          color:Colors.white,
                          fontSize: 20
                        )
                        )),
                        onTap: () {
                          setState(() {});
                        },
                      ))),
            )
          ]),
        ),
      ),
    ));
  }
}

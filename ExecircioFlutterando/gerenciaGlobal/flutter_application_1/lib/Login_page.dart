import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Segunda_tela.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ///  lista de Widgets

              Padding(
                padding: const EdgeInsets.all(08),
                child: TextField(
                    controller: nome,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Login",
                      hintText: "Login",
                    ),
                    keyboardType: TextInputType.name),
              ),
              Padding(
                padding: const EdgeInsets.all(08),
                child: TextField(controller: senha, decoration: const InputDecoration(labelText: "Senha", hintText: "Senha", border: OutlineInputBorder()), obscureText: true),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nome.text);
                    print(senha.text);
                    if (nome.text == "ricacio" && senha.text == "123") {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return const Tela2();
                      }));
                    }
                  },
                  child: const Text("Entrar"))
            ])));
  }
}

import 'package:flutter/material.dart';
import 'package:tela_widget/pagina2.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => Estado();
}

class Estado extends State<HomeApp> {
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/image/fundo.jpeg',
            fit: BoxFit.cover,
          )),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.asset(
              'assets/image/logo.png',
              width: 100,
              height: 100,
            )),
            SizedBox(height: 15),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: <Widget>[
                TextField(
                    keyboardType: TextInputType.name,
                    controller: login,
                    decoration: InputDecoration(
                        hintText: "Login",
                        labelText: "Login",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                TextField(obscureText: true, controller: senha, decoration: InputDecoration(hintText: "Senha", labelText: "Senha", border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)))),
                const SizedBox(height: 15),
                Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          if ((this.login.text == 'ricacio') && (this.senha.text == '123')) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Tela2(login: login, senha: senha)));
                          } else {
                            print(this.login.text);
                            print(this.senha.text);
                          }
                        },
                        icon: const Icon(Icons.refresh_outlined),
                        label: const Text('Entrar')))
              ]),
            )),
            const SizedBox(height: 15)
          ],
        ),
      )
    ]));
  }
}

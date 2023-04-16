import 'package:flutter/material.dart';
import 'package:tela_login/tela2.dart';

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
        body: Stack(children: [
      Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset('assets/fundo.jpg', fit: BoxFit.cover)),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipOval(
                child: Image.asset(
              'assets/castelo_logo.png',
              width: 100,
              height: 100,
            )),
            const SizedBox(height: 70),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(children: [
                TextField(controller: login, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Nome', labelText: 'Nome')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: senha,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'senha',
                      labelText: 'senha',
                    )),
                Container(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        if (login.text == 'ricacio' && senha.text == '123') {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Tela2(login:login,senha:senha);
                          }));
                        }
                      },
                      icon: const Icon(Icons.refresh_outlined),
                      label: const Text("Entrar")),
                )
              ]),
            ))
          ]),
        ),
      )
    ]));
  }
}

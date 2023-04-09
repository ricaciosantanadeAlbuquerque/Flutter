import 'package:flutter/material.dart';
import 'package:tela_widget3/Tela2.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() {
    return EstadoHomeApp();
  }
}

class EstadoHomeApp extends State<HomeApp> {
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset('assets/image/fundo.jpeg', fit: BoxFit.cover)),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(child: ClipOval(child: Image.asset('assets/image/logo.png', width: 100, height: 100))),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nome,
                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'nome', labelText: 'nome'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: senha,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'senha',
                        hintText: 'senha',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 08, right: 10, bottom: 8),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
                          onPressed: () {
                            if (nome.text == 'ricacio' && senha.text == '123') {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Tela2(nome: nome, senha: senha);
                                },
                              ));
                            }
                          },
                          icon: const Icon(Icons.refresh_outlined),
                          label: const Text('Entrar'))),
                )
              ])),
            )
          ],
        ),
      )
    ]));
  }
}

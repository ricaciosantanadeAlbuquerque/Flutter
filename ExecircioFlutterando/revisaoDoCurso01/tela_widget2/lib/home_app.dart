import 'package:flutter/material.dart';
import 'package:tela_widget2/Tela22.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() {
    return Estado();
  }
}

class Estado extends State<HomeApp> {
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset('assets/image/fundo.jpeg', fit: BoxFit.cover)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/image/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(controller: login, decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Login', hintText: 'Login')),
                  const SizedBox(height: 13),
                  TextField(
                    controller: senha,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      hintText: 'Senha',
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (login.text == 'ricacio' && senha.text == '123') {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Tela22(login: login, senha: senha);
                          }));
                        } else {
                          print("ERRO!");
                        }
                      },
                      icon: const Icon(Icons.refresh_outlined),
                      label: const Text('Entrad'),
                    ),
                  )
                ],
              ),
            )),
          ],
        )
      ],
    ));
  }
}

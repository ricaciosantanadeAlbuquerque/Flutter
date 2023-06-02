import 'package:flutter/material.dart';
import 'package:tela_login007/coluna.dart';
import 'package:tela_login007/segunda_tela.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();

  void comparando() {
    if (login.text == 'ricacio' && senha.text == '123') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Tela2(login: login,senha: senha,);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/fundo.jpg', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
          Coluna(
            login: login,
            senha: senha,
            funcao: comparando,
          ),
        ],
      ),
    );
  }
}

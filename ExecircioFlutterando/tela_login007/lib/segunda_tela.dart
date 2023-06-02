import 'package:flutter/material.dart';
import 'package:tela_login007/cabeca.dart';
import 'package:tela_login007/principal_segundaTela.dart';


class Tela2 extends StatefulWidget {
  TextEditingController login;
  TextEditingController senha;

  Tela2({super.key, required this.login, required this.senha});
  @override
  State<Tela2> createState() => Tela2State();
}

class Tela2State extends State<Tela2> {
  int _cont = 0;

  void contador() {
    setState(() {
      _cont++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Cabeca(),
      appBar: AppBar(
          title: const Center(
        child: Text('Home Page'),
      )),
      body: Principal(
        cont: _cont,
        funcao: contador,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: contador,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

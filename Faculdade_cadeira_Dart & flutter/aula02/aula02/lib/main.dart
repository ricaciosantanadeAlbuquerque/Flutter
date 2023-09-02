import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
runApp(new Aula02()); // runApp() executa uma instância da classe Aula02()
}

class Aula02 extends StatelessWidget {  // A classe Aula02 herda tudo da Classe StatelessWidget por herança

  Widget build(BuildContext context){ // o método build retorna um objeto widget no caso a raiz MaterialApp()
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Seja Bem vindo !"),
        ),
        body: Text("Pergunta 1"),
      )// A instância Scaffold() recebe como argumento o parametro appBar
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Aula01());// o método runApp() executa a classe Aula01
// main() agora é uma função flexa

class Aula01 extends StatelessWidget{ // criamos  uma classe de nome Aula01 que herda tudo da classe StatilessWidget
  @override
  Widget build(BuildContext context){ // criamos um método chamado build irá retornar um objeto Widget, no caso o MaterialApp()
    return MaterialApp( 
      home: Text("Olá Mundo"),
    );// MaterialApp() recebe como argumento um parâmetro nominado chamado home:, que por suas vez recebe um Widget Text()
    // Text() é uma instância da classe Text, que por sua vez recebe um parâmetro posicional chamado "Olá mundo "
  }
}
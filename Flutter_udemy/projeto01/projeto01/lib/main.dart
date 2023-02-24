import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatelessWidget{
  const PerguntaApp({super.key});
  // toda classe  que é um StatelessWidget deve implementar o método build()

  @override
  Widget build(BuildContext context){
    return  const MaterialApp(
        home: Text("Olá Flutter")
    );
  }
  // está sendo retornado uma instânia  da classe MaterialApp(), que por sua vez possui um parâmetro nomeado que possui uma instância da classe Text()
}
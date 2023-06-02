import 'package:flutter/material.dart';

class Escolha extends StatelessWidget {
  final bool valor;
  final void Function(bool) funcao;
  const Escolha({super.key,required this.valor,required this.funcao});
  @override
  Widget build(BuildContext context){
    return Switch(value: valor, onChanged: funcao);
  }
}

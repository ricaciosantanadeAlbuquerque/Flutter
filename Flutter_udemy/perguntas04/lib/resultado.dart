import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int valor;
  final void Function() funcao;

  const Resultado({super.key, required this.funcao, required this.valor});

  String get pontuacao {
    if (valor < 8) {
      return 'Bom !';
    } else if (valor < 16) {
      return 'Mediano';
    }else {
      return 'Nível Mestre!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Text(pontuacao), 
        TextButton(onPressed: funcao, child: const Text('Reset!')
        )
        ]
        ),
    );
  }
}

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() funcao;
  final int pontuacao;

  const Resultado({super.key, required this.funcao, required this.pontuacao});

  String get ponto {
    if (pontuacao < 8) {
      return 'bom!';
    } else if (pontuacao < 12) {
      return 'Muito bom !';
    } else {
      return 'Você é Um Mestre neste jogo !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Text(ponto,
          style:const TextStyle(
            fontSize:18,
            color:Colors.red
          )),
          ElevatedButton(
            onPressed:funcao,
            child:const Text("Resetar!",
            ),
            ),
        ]
      ),
    );
  }
}

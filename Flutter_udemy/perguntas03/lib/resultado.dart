import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int ponto;
  final void Function() funcao;

  const Resultado({super.key, required this.ponto, required this.funcao});

  String pontuacao(){
    if(ponto < 8){
      return 'bom';
    }else if(ponto < 12){
      return 'Muito bom!';
    }else{
      return 'Mestre!';
    }
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(pontuacao()),
          ElevatedButton(
            onPressed:funcao,
            child:const Text("Resetar!")
            )
        ]
      ),
    );
  }
}

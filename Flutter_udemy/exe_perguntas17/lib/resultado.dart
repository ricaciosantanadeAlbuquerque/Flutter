import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() onReset;
  const Resultado({super.key, required this.pontuacao, required this.onReset});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parábens !';
    } else if (pontuacao < 12) {
      return 'Você é bom !';
    } else if (pontuacao < 16) {
      return 'Impressionante !';
    } else {
      return 'Nível jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Text(fraseResultado,
            style:const TextStyle(
              fontSize:28
            ),
            ),
            Container(
              width:125,
              child: ElevatedButton(onPressed:onReset,child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado({super.key, required this.pontuacao});

  String get fraseResultado {

    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante !';
    } else {
      return 'Nível jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          fraseResultado,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

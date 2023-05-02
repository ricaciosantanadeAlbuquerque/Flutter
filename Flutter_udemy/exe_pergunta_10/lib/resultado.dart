import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() resetar;

  const Resultado({super.key, required this.resetar, required this.nota});

  String get result {
    if (nota < 8) {
      return 'parabéns';
    } else if (nota < 12) {
      return 'Você é bom';
    } else if (nota < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Padding(padding: const EdgeInsets.all(10), 
            child: Text('$result sua nota é $nota')
            ),
             TextButton(onPressed: resetar, child: const Text('Resetar !')
             )
             ]
             ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() onReset;

  const Resultado({super.key, required this.nota, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ' fim !',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          ElevatedButton(
            onPressed: onReset,
            child: const Text('Test !'),
          ),
        ],
      ),
    );
  }
}

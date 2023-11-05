import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
           const Text(
          ' fim !',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        ElevatedButton(
          onPressed:(){},
          child: const Text('Test !'),
        ),
        ],
      ),
    );
  }
}

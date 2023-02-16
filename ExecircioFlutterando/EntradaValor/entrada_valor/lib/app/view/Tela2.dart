import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  TextEditingController? sainda;

  Tela2({this.sainda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("========${sainda!.text}========")],
        ),
      ),
    );
  }
}

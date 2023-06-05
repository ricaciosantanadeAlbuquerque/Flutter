import 'package:flutter/material.dart';

class Imagens extends StatelessWidget {
  const Imagens({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/logo.jpg',
      width:100,
      height:100),
      );
  }
}

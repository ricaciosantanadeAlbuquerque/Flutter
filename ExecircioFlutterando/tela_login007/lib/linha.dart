import 'package:flutter/material.dart';

class Linha extends StatelessWidget {
  const Linha({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: [
        Container(
          color:Colors.black,
          width: 100,
          height:100,
        ),
        Container(
          color: Colors.black,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.black,
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}

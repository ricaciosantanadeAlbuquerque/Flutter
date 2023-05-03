import 'package:flutter/material.dart';

class Imagem extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Container(
                  margin:const EdgeInsets.all(10),
                  child: Image.asset('assets/logo.jpg',width: 100,height:100)
                  );
  }
}
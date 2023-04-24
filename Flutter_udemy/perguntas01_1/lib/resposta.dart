import 'package:flutter/material.dart';

class Resposta  extends StatelessWidget{
  final String texto;
  final void Function() p;
  const Resposta({required this.texto,required this.p,super.key});
@override
Widget build(BuildContext context){
  return SizedBox(
    width: double.infinity,
    child:ElevatedButton(onPressed:p, child:Text(texto)
    )
  );
}
}
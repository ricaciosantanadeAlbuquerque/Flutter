import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget{

const PaginaInicial({super.key});

@override
  State <StatefulWidget>createState(){
    return Estado();      // necessário receber um estado
}

}
//+++======================================++++++++++=================+++++++++++=========================++++++++++++================
class Estado extends State<StatefulWidget>{
  int cont = 0;

  @override
   Widget build(BuildContext context){
    
    return Container(
      child: Center(
        child: GestureDetector(
          child: Text("contado $cont"),
          onTap:(){
            setState(() {
              cont++;
            });
          }
        ),
      )
    );
   }
}
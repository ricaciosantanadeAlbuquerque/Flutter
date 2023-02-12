import 'package:converso_de_moeda/Aplicativo/model/Moeda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget{
  TextEditingController controller;
  Moeda selecionar;
  List<Moeda>? array;
   Function(Moeda?)? onChanged;

  CampoTexto({required this.controller, required this.selecionar, required this.array, required this.onChanged});

@override
Widget build(BuildContext context){
  return SizedBox(
                width:MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                       height: 62,
                        child: DropdownButton<Moeda>(
                          value:selecionar,
                          underline: Container(height:1,color:Colors.amberAccent),
                          isExpanded: true,
                          items: array!.map((e) => DropdownMenuItem(
                             value: e,
                             child: Text(e.getNome)
                             )
                             ).toList(),
                           onChanged: onChanged
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                     Expanded(
                      flex:4,
                      child: TextField(
                        controller: controller,
                        decoration:const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.amberAccent)
                          ),
                          focusedBorder:UnderlineInputBorder(
                           borderSide: BorderSide(color:Colors.amberAccent) 
                          )
                        )
                      )
                      )
                     ]
                     ),
              );
}
}
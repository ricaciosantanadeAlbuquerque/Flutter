import 'dart:ui';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  dynamic arrayImage;
  dynamic arrayNome;
  dynamic arrayData;
  int tamanho = 10;
  Lista({this.arrayImage, this.arrayNome, this.arrayData});

  @override
  State<Lista> createState() {
    return EstadoLista();
  }
}

class EstadoLista extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Contatos!"),
      ),
      body: ListView.builder(
        itemCount: widget.arrayNome.length, // itemCount:requer um inteiro por isso o uso do length
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(40), 
            ),
              color: Colors.greenAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                 Padding(
                  padding: const EdgeInsets.all(08),
                   child: CircleAvatar(
                    radius: 40,
                    backgroundColor:Colors.greenAccent,
                    child:CircleAvatar(
                      radius:30,
                      backgroundColor: Colors.white,
                       backgroundImage:NetworkImage(widget.arrayImage[index])
                    )
                   ),
                 ),
                 Padding(
                  padding:const EdgeInsets.all(03),
                   child: Text("${widget.arrayNome[index]}",
                   style:const TextStyle(
                    fontSize:20,
                    color: Colors.black
                   )
                   ),
                 ),
                  Padding(
                  padding:const EdgeInsets.all(08),
                  child: Container(
                    child:Row(
                      children: [
                        Text(timeago.format(widget.arrayData[index], locale: 'pt_br')),
                        const Icon(Icons.timelapse),
                        
                      ],
                    )
                  )
                 )
              ]
            )
            );
        },
      ),
    );
  }
}

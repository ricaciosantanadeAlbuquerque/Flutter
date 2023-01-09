import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0, 
            title: const Text("WhatsApp"),
            backgroundColor: Colors.greenAccent,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                     onPressed: () {}),
                      IconButton(icon: 
                      const Icon(Icons.more_vert),
                      onPressed: (){

                      })
                     ]
                     )
            ]),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              color: Colors.greenAccent,
              height:40,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget> [
                   Container(
                      width:167,
                      height:40,
                      color: Colors.greenAccent,
                      child:Row(
                        children: <Widget> [
                          IconButton(onPressed: (){}, 
                          icon:const Icon(Icons.camera_alt),
                          color: Colors.white ),
                          const Text("CONVERSAS",
                          style:TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ))
                        ]
                      )
                   
                   ),
                   Container(
                    width: 100,
                    height: 40,
                    color: Colors.greenAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: const Text("STATUS",
                           style: TextStyle(fontSize: 20, color:
                            Colors.white)
                            ), onTap: () {}),
                      ]
                    )
                  ),
                  Container(
                    width: 133,
                    height: 40,
                    color: Colors.greenAccent,
                    child:Row(
                      children: <Widget>[
                        GestureDetector(
                          child:const Text("CHAMADAS",
                          style:TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                        )
                      ]
                    )
                  ),
                ]
              )
            ),
            Container(
              color:Colors.blue,
              height: MediaQuery.of(context).size.height,
              child:ListView.builder(
                scrollDirection: Axis.vertical,
              itemCount:10,
              itemBuilder:(BuildContext context, int index){
              
                return Container(
                  height:70,
                  child: Card(
                    borderOnForeground: true,
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.greenAccent,
                          child:CircleAvatar(
                            radius: 30,
                            backgroundColor:Colors.white,
                          )
                          
                        ),
                        Padding(padding: EdgeInsets.all(08),
                        child: Container(
                          child:Column(
                            children: <Widget> [
                              Text("Titulo"),
                              Text("subTitulo")
                            ]
                          )
                        )
                        ),
                        Container(
                          child: Text(" data e hora "),
                        )
                      ],
                    )
                  ),
                );
              })
            ) 
            
          ]),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.chat)));
  }
}


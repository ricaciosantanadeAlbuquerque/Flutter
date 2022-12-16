
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
 runApp(const MinhaLista());
}

class MinhaLista extends StatelessWidget {
  const MinhaLista({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Gerente()
    );
  }
}

class Gerente extends StatefulWidget{
  const Gerente({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
 
}

class Estado  extends  State<StatefulWidget>{
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Center(
          child: Text("Lista")
      ),
    ),
    body:Container(
      child:ListView(
          scrollDirection:  Axis.horizontal,
        children: <Widget>[
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                            Container(width: 50, height: 50, color: Color.fromARGB(255, 238, 223, 223)),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                     Container(width: 50, height: 50, color: Color.fromARGB(255, 3, 142, 249)),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Color.fromARGB(255, 244, 7, 7)),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Color.fromARGB(177, 2, 245, 55)),
                                Container(width: 50, height: 50, color: Color.fromARGB(255, 238, 223, 223)),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Color.fromARGB(255, 3, 142, 249)),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Color.fromARGB(255, 244, 7, 7)),
                    Container(width: 50, height: 50, color: Colors.black),
                    Container(width: 50, height: 50, color: Color.fromARGB(177, 2, 245, 55)),

                  ],
                )
              ],
            )
        ],
      )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed:(){},
      child: const Icon(Icons.add)
    )
  );
}
}
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

// ---------------- StatefulWidget-------------------
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  perguntaAppState createState() => perguntaAppState();
}

//------------------Estado-------------------------------
class perguntaAppState extends State<PerguntaApp>{
// =================================Atribultos de classe ==================================================
  var perguntaSelecionada = 0;

  final List<String> pergunta = ["Qual a sua cor favorita ?","Qual é o seu animal favorito ? "];
//=====================================Métodos da classe====================================================
   respoder() {
   if(perguntaSelecionada < 2){
     setState(() {
        perguntaSelecionada++;
      });
   }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar:AppBar(
        title:const Center(
          child: Text("Perguntas")
        )
      ),
      body:Column(
        children:<Widget>[
          Text(pergunta[perguntaSelecionada]),
          Padding(
            padding:const EdgeInsets.all(8),
            child:ElevatedButton(
              onPressed:respoder,
              child:const Text("Respota1"))
          ),
          Padding(
            padding:const EdgeInsets.only(left: 8,right:8,bottom:8),
            child:ElevatedButton(onPressed:respoder,
            child:const Text("Resposta2"))
          ),
          Padding(
            padding:const EdgeInsets.only(left: 8, right:8,bottom:8),
            child:ElevatedButton(onPressed:respoder,child:const Text("Respoder3")) ,)
        ]
      )
    )
    );
  }
}

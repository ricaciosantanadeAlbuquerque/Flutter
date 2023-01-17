import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const HomeMeuApp(),
    );
  }
}

class HomeMeuApp extends StatefulWidget {
  const HomeMeuApp({super.key});
  @override
  State<HomeMeuApp> createState() => Estado();
}

class Estado extends State<HomeMeuApp> {

  TextEditingController p = TextEditingController();
  String pasta = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Copy & Paste"),
      centerTitle: true,
    ),
    body:Container(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget> [
          buildCopy(),
          buildPaste()
        ]
      )
    )
    );
  }

  Widget buildCopy() {
    return Row(children: <Widget>[
      Expanded(
        child: TextField(
          controller: p,
          decoration: const InputDecoration(
            border:OutlineInputBorder(),
            hintText:"Digite algo!"
          )),
      ),
      IconButton(onPressed: ()async{
      
      await FlutterClipboard.copy(p.text);

      }, icon: const Icon(Icons.content_copy))
    ]);
  }

  Widget buildPaste() {
    return Row(
      children: <Widget>[
        Expanded(
          child:Text(pasta) // not null !
        ),
        IconButton(
          onPressed:()async{
           var entrada = await FlutterClipboard.paste();
           setState(() {
             this.pasta = entrada;
           });
          },
          icon:const Icon(Icons.paste)
        )
      ]
    );
  }
}

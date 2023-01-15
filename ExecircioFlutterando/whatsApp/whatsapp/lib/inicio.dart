import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:whatsapp/tela_lista.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
  TextEditingController p = TextEditingController();
  dynamic entradaPasta;
  String entradaNome = "";
  dynamic entradaLink = "";
  List<dynamic> imagem = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSdxqhqCUlWUU7sshGQuZzvgL6SkA7d6QUA&usqp=CAU",
  ];
  List<String> nome = ["João"];
  List<DateTime> datas = [
    DateTime.now(),
    DateTime.now().subtract(const Duration(minutes: 3)),
    DateTime.now().subtract(const Duration(minutes: 12)),
    DateTime.now().subtract(const Duration(minutes: 43)),
    DateTime.now().subtract(const Duration(hours: 1, minutes: 23)),
    DateTime.now().subtract(const Duration(hours: 6, minutes: 23)),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 1, hours: 6, minutes: 23)),
    DateTime.now().subtract(const Duration(days: 2, hours: 6, minutes: 23)),
    DateTime.now().subtract(const Duration(days: 2, hours: 8, minutes: 23))
  ];
  void passarDados() {
    
    setState(() {
     
      Navigator.push(context, MaterialPageRoute(builder: (context) => Lista(arrayImage: imagem,arrayNome: nome,arrayData: datas,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: const Text("WhatsApp"), backgroundColor: Colors.greenAccent, actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  passarDados();
                }),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})
          ])
        ]),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                color: Colors.greenAccent,
                height: 40,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Container(
                      width: 167,
                      height: 40,
                      color: Colors.greenAccent,
                      child: Row(children: <Widget>[IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt), color: Colors.white), const Text("CONVERSAS", style: TextStyle(fontSize: 20, color: Colors.white))])),
                  Container(
                      width: 100,
                      height: 40,
                      color: Colors.greenAccent,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                        GestureDetector(child: const Text("STATUS", style: TextStyle(fontSize: 20, color: Colors.white)), onTap: () {}),
                      ])),
                  Container(
                      width: 133,
                      height: 40,
                      color: Colors.greenAccent,
                      child: Row(children: <Widget>[
                        GestureDetector(
                          child: const Text("CHAMADAS",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        )
                      ])),
                ])),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: imagem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 70,
                        child: Card(
                            borderOnForeground: true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40, 
                                  backgroundColor: Colors.greenAccent,
                                   child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor:
                                     const Color.fromRGBO(255, 255, 255, 1),
                                      backgroundImage: NetworkImage(imagem[index])
                                     )
                                     ),
                                Padding(
                                  padding: EdgeInsets.all(08),
                                   child: Container(
                                    child: Column(
                                      children: <Widget>[Text(nome[index],
                                       style: const TextStyle(
                                        fontSize: 20, 
                                        color: Color.fromARGB(255, 11, 11, 11)))]))),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(Icons.timelapse),
                                    Text(timeago.format(datas[index], locale: 'pt_br')
                                    ),
                                  ],
                                ))
                              ],
                            )),
                      );
                    }))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                                onChanged: (text) {
                                  entradaNome = text;
                                },
                                decoration: const InputDecoration(hintText: "Digite seu nome aqui!")),
                          ],
                        ),
                      ),
                      actions: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  final valeu = await FlutterClipboard.paste();
                                  setState(() {
                                    entradaPasta = valeu;
                                    imagem.add(entradaPasta);
                                    nome.add(entradaNome);
                                  });
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.paste)),
                            TextField(
                                onChanged: (text) {
                                  entradaLink = entradaPasta;
                                },
                                decoration: const InputDecoration(hintText: "Click na Pasta para colar o link da imagem")),
                          ],
                        )
                      ],
                    );
                  });
            },
            child: const Icon(Icons.chat)));
  }
}

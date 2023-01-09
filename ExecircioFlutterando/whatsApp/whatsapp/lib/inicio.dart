import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: const Text("WhatsApp"), backgroundColor: Colors.greenAccent, actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[IconButton(icon: const Icon(Icons.search), onPressed: () {}), IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})])
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
                                CircleAvatar(radius: 40, backgroundColor: Colors.greenAccent, child: CircleAvatar(radius: 30, backgroundColor: Color.fromRGBO(255, 255, 255, 1), backgroundImage: NetworkImage(imagem[index]))),
                                Padding(padding: EdgeInsets.all(08), child: Container(child: Column(children: <Widget>[Text(nome[index], style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 11, 11, 11)))]))),
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(Icons.timelapse),
                                    Text(timeago.format(datas[index], locale: 'pt_br')),
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
                        height: 190,
                        child: Column(children: <Widget>[
                          const Padding(padding: EdgeInsets.all(8), child: Text("Digite seu nome!")),
                          TextFormField(
                            onChanged: (text) {
                              entradaNome = text;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(8), child: Text("Cole o link da sua imagem de perfil!")),
                          TextFormField(
                              onChanged: (text) {
                                entradaLink = text;
                              },
                              decoration: const InputDecoration(border: OutlineInputBorder())),
                        ]),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                             setState(() {
                                nome.add(entradaNome);
                                imagem.add(entradaLink);
                              
                             });
                               Navigator.of(context).pop();
                            },
                            child: const Text("Salvar"))
                      ],
                    );
                  });
            },
            child: const Icon(Icons.chat)));
  }
}

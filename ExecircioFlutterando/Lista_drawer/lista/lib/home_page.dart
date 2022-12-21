import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageEstado();
  }
}

class HomePageEstado extends State<StatefulWidget> {
  var listaContatos = [];
  String valor = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Container(
          color: Colors.green,
          child: ListView.builder(
              itemCount: listaContatos.length,
              itemBuilder: (context, index) {
                // o index será a variável de controle
                return Card(
                    child: ListTile(
                        title: Text(listaContatos[index]),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              listaContatos.removeAt(index); // estamos removendo o elemento pela sua posição nalista
                            });
                          },
                          icon: const Icon(Icons.delete),
                        )));
              }),
        )),
        appBar: AppBar(title: const Center(child: Text("Lista de contatos"))),
        body: Container(
            color: Color.fromARGB(255, 100, 162, 102),
            child: ListView.builder(
                itemCount: listaContatos.length,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                          title: Text(listaContatos[index]),
                          leading: const Icon(Icons.phone_android),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                listaContatos.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          )));
                })),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        title: const Text("Digite um valor "),
                        content: TextField(
                          onChanged: (text) {
                            valor = text;
                          },
                          decoration: const InputDecoration(labelText: "Por favor informe um nome", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                        ),
                        actions: <Widget>[
                          // não use Column() no AlertDialog()
                          Container(
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          listaContatos.add(valor);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Entrar"))),
                            ),
                          )
                        ],
                      );
                    });
              });
            },
            child: const Icon(Icons.add)));
  }
}

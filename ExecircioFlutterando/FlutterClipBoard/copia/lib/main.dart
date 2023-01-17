import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() {
    return EstadoHomeApp();
  }
}

class EstadoHomeApp extends State<HomeApp> {
  
  TextEditingController p = TextEditingController();
  String valor = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("copia & pasta"),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: p,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await FlutterClipboard.copy(p.text);
                      const SnackBar(content: Text("Copiado com sucesso!"));
                    },
                    icon: const Icon(Icons.content_copy))
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Text(valor),

              ),
              IconButton(onPressed: ()async{

               var valeu = await FlutterClipboard.paste(); 

               setState((){
                this.valor = valeu;
               });

              }, icon: const Icon(Icons.paste))
              ]
              )
          ],
        )));
  }
}

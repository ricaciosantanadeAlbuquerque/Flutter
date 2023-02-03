import 'package:converso_moeda02/App/Controllers/Home_Controller.dart';
import 'package:converso_moeda02/App/componentes/Compo_TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  HomeControlle? controle;
  
  @override
  void initState() {
    super.initState();
    controle = new HomeControlle(entrada: entrada, saida: saida);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Image.asset("assets/converso.jpg", width: 100, height: 100),
            CompoTextField(item:controle!.lista!,controlle: entrada, selecionarItem: controle!.de!,onChanged: (model){
                setState(() {
                  controle!.de = model;
                });
            }),
            const SizedBox(height: 15),
            CompoTextField(item: controle!.lista!,controlle: saida,selecionarItem: controle!.para!, onChanged: (model){
                setState((){
                  controle!.para = model;
                });
            }),
            const SizedBox(height: 40),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.amber), onPressed: () {
              setState((){
                controle!.converte();
              });
            }, child: const Text("Converso"))
          ])),
    ));
  }
}

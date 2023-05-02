import 'package:consumo_api_http/app/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeAppLista extends StatefulWidget {
  const HomeAppLista({super.key});
  @override
  HomeAppListaState createState() => HomeAppListaState();
}

class HomeAppListaState extends State<HomeAppLista> {
  Controle77 controle = Controle77();
// ====================sucesso============================
  Widget sucesso() {
    return Container(
      child: Center(
        child: ListView.builder(
            itemCount: controle.lista.value.length,
            itemBuilder: (context, index) {
              var todos = controle.lista.value[index];
              return ListTile(
                title: Text(todos.toString()),
              );
            }),
      ),
    );
  }

//===================carregando============================
  Widget carreagndo() {
    return const Center(child: CircularProgressIndicator());
  }

//==================inicio===================================
  Widget inicio() {
    return Container(child: const Text('Inicio'));
  }

//=================erro======================================
  Widget erro() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              controle.start();
            },
            child: const Text('Resetar')),
      ),
    );
  }

//====================== manejo=============================
  manejo(Estado estado) {
    switch (estado) {

      case Estado.inicio:
        return inicio();
      case Estado.carregando:
        return carreagndo();
      case Estado.sucesso:
        return sucesso();
      case Estado.erro:
        return erro();
    }
  }

  @override
  void initState() {
    super.initState();
    controle.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Lista todos')
        ),
        actions:[IconButton(
          onPressed:(){
            controle.start();
          },
          icon:const Icon(Icons.refresh_outlined)
        )]
        ),
        body: AnimatedBuilder(
            animation: controle.estado,
            builder: (context, child) {
              return manejo(controle.estado.value);
            }));
  }
}

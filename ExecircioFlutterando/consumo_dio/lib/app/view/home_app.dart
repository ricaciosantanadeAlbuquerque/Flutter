import 'package:consumo_dio/app/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  HomeAppState createState() {
    return HomeAppState();
  }
}

class HomeAppState extends State<HomeApp> {
  Controle controle = Controle();

  @override
  void initState() {
    controle.inicio();
    super.initState();
  }

  Widget inicio() {
    return Container(child: const Center(child: Text("Inicio")));
  }

  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget sucesso() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
          itemCount: controle.lista.value.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(controle.lista.value[index].toString()));
          }),
    );
  }

  Widget erro() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controle.inicio();
          },
          child: const Text("Resetar!")),
    );
  }

 Widget escolha(Estado estado) {
    switch (estado) {
      case Estado.inicio:
        return inicio();
      case Estado.carregando:
        return carregando();
      case Estado.sucesso:
        return sucesso();
      case Estado.erro:
        return erro();
      default:
        return inicio();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Center(
          child: Text('Consumo ! API'),
          ) , 
          actions:[ IconButton(onPressed:(){controle.inicio();},icon:const Icon(Icons.refresh_outlined),),
          ] 
      ),
      body: AnimatedBuilder(
      animation: controle.estado,
      builder: (BuildContext context, Widget? child) {
        return escolha(controle.estado.value);
      },
    )
    );
  }
}

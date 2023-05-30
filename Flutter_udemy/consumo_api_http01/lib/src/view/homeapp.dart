import 'package:consumo_api_http01/src/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  Controle controle = Controle();

  Widget inicio() {
    return Container();
  }

  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget sucesso() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: controle.lista.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controle.lista.value[index].toString()),
            );
          }),
    );
  }

  Widget erro() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controle.iniciar();
          },
          child: const Text("Reiniciar!")),
    );
  }

  escolha(Estado estado) {
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
  void initState() {
     controle.iniciar();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text("Consumo API"),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controle.iniciar();
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
          ]),
      body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return escolha(controle.estado.value);
          }),
    );
  }
}

import 'package:consumo_dio_api11/src/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  Controle controle = Controle();
  // ==================================início=====================================
  Widget inicio() {
    return Container(
        child: const Center(
      child: Text('INÍCIO'),
    ));
  }

  // ================================carregar======================================
  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

  // ===============================sucesso========================================
  Widget sucesso() {
    return ListView.builder(
        itemCount: controle.lista.value.length,
        itemBuilder: (context, index) {
          var lista = controle.lista.value[index];
          return ListTile(leading: Checkbox(value: controle.lista.value[index].completed, onChanged: (value) {}), title: Text(lista.toString()));
        });
  }

  // ===============================erro===============================================
  Widget erro() {
    return Container(
        child: Center(
            child: TextButton(
      onPressed: () {
        controle.iniciar();
      },
      child: const Text('Resetar !'),
    )));
  }

  manejo(Estado estado) {
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
    super.initState();
    controle.iniciar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Lista Api_dio')), actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              controle.iniciar();
            },
          )
        ]),
        body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return manejo(controle.estado.value);
          },
        ));
  }
}

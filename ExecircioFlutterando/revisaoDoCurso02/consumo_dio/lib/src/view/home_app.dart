import 'package:consumo_dio/src/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => EstadoHomeApp();
}

//================================================================================================================
class EstadoHomeApp extends State<HomeApp> {
  final Controle controle = Controle();

  Widget inicio() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }

  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget sucesso() {
    return Center(
        child: ListView.builder(
      itemCount: controle.lista.value.length,
      itemBuilder: (context, index) {
        var lista = controle.lista.value[index];
        return ListTile(title: Text(lista.toString()));
      },
    ));
  }

  Widget erro() {
    return Center(
      child: ElevatedButton.icon(
          onPressed: () {
            controle.start();
          },
          icon: const Icon(Icons.refresh_outlined),
          label: const Text('Tente Novamente !')),
    );
  }
// =================================================================================================================================

  manejoEstado(EstadoJJ estado) {
    switch (estado) {
      case EstadoJJ.inicio:
        return inicio();
      case EstadoJJ.carregando:
        return carregando();
      case EstadoJJ.sucesso:
        return sucesso();
      case EstadoJJ.erro:
        return erro();
      default:
        return inicio();
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
        appBar: AppBar(
          title: const Text("ListaAPI"),
        ),
        body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return manejoEstado(controle.estado.value);
          },
        ));
  }
}

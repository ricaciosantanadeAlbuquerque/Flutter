import 'package:consumo_api_dio_test08/src/controller/controle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() {
    return EstadoApp();
  }
}

class EstadoApp extends State<HomeApp> {
  Controle controle = Controle();

  @override
  void initState() {
    super.initState();
    controle.iniciar();
  }
  // funcao que retorna um Widget em banco, justamen porque é o inicio e não aconteceu nada.

  Widget iniciar() {
    return Container();
  }

  //============carregando===================

  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

  // ===========Sucesso======================
  Widget sucesso() {
    return ListView.builder(
      itemCount: controle.lista.length,
      itemBuilder: (context, index) {
        var lista = controle.lista[index]; // o index é quem vai Iterar sobre a lista
        return ListTile(
          leading: Checkbox(value: lista.completed, onChanged: (value) {}),
          title: Text((lista.id.toString())),
        );
      },
    );
  }

// =============Erro=========================

  Widget erro() {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              controle.iniciar();
            },
            child: const Text('Tentar novamente')));
  }

// ========================================================================
  manuzeandoEstado(Estado estado) {
    switch (estado) {
      case Estado.inicio:
        return iniciar();
      case Estado.carregando:
        return carregando();
      case Estado.sucesso:
        return sucesso();
      case Estado.erro:
        return erro();
      default:
        return erro();
    }
  }

  // =======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lista"), actions: [
          IconButton(
              onPressed: () {
                controle.iniciar();
              },
              icon: const Icon(Icons.refresh_outlined))
        ]),
        body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return manuzeandoEstado(controle.estado.value);
          },
        ));
  }
}

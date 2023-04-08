import 'package:consumo_http/src/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  Estado createState() => Estado();
}

class Estado extends State<HomeApp> {
  Controle controle = Controle();

  @override
  void initState() {
    super.initState();
    controle.start();
  }

  Widget inicio() {
    return Container(
      width: double.infinity,
      height: double.infinity,
    );
  }

// ===============================================================
  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

// ===============================================================
  Widget sucesso() {
    return ListView.builder(
        itemCount: controle.lista.value.length,
        itemBuilder: (__, index) {
          var objeto = controle.lista.value[index];
          return ListTile(
            leading: Checkbox(value: objeto.completed, onChanged: (value) {}),
            title: Text(objeto.id.toString()),
          );
        });
  }

// ===============================================================
  Widget erro() {
    return Center(
      child: ElevatedButton.icon(
          onPressed: () {
            controle.start();
          },
          icon: const Icon(Icons.read_more_outlined),
          label: const Text('Tente Novamente mais tarde')),
    );
  }

// ===============================================================
  manejamento(GerenciaEstado estado) {
    switch (estado) {
      case GerenciaEstado.inicio:
        return inicio();
      case GerenciaEstado.carregado:
        return carregando();
      case GerenciaEstado.sucesso:
        return sucesso();
      case GerenciaEstado.erro:
        return erro();
    }
  }

// ===============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista HTTP"), actions: [
        IconButton(
            onPressed: () {
              controle.start();
            },
            icon: const Icon(Icons.refresh_outlined))
      ]),
      body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return manejamento(controle.estado.value);
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controle.start();
          },
          child: const Icon(Icons.abc_outlined)),
    );
  }
}

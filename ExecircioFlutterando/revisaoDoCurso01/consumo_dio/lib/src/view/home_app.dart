import 'package:consumo_dio/src/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  HomeApp({super.key});
  @override
  Estado createState() => Estado();
}

// ============= estado ===================
class Estado extends State<HomeApp> {
  final Controle controle = Controle();

  @override
  void initState() {
    super.initState();
    controle.start();
  }

  Widget inici() {
    return Container();
  }

  // ===================================================================
  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }

  // ===================================================================
  Widget sucesso() {
    return ListView.builder(
        itemCount: controle.lista.value.length,
        itemBuilder: (context, index) {
          var listaApi = controle.lista.value[index];
          return ListTile(
            leading:Checkbox(value:listaApi.completed,onChanged: (value){},),
            title: Text(listaApi.id.toString()));
        });
  }

  // ===================================================================
  Widget erro() {
    return Center(
      child: ElevatedButton.icon(
          onPressed: () {
            controle.start();
          },
          icon: const Icon(Icons.refresh_outlined),
          label: const Text('Tente mais tarde ')),
    );
  }

  // ===================================================================
  manejador(EstadoTipo estado) {
    switch (estado) {
      case EstadoTipo.inicio:
        return inici();
      case EstadoTipo.carregando:
        return carregando();
      case EstadoTipo.sucesso:
        return sucesso();
      case EstadoTipo.erro:
        return erro();
    }
  }
  // ====================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Lista<API> ")
        ),
        actions:[
          IconButton(onPressed: () { 
            controle.start();
           }, icon: const Icon(Icons.refresh_outlined),)
        ]
        ),
        body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return manejador(controle.estado.value);
          },
        ));
  }
}

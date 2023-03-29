import 'package:consumo_api_dio_test07/src/controller/controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => Estado();
}

class Estado extends State<HomeApp> {
  Controle controle = Controle();
  
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Widget inicio() {
    return Container();
  }
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Widget erro() {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              controle.iniciar();
            },
            child: const Text("Tente novamente !")));
  }
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Widget carregando() {
    return const Center(child: CircularProgressIndicator());
  }
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Widget sucesso() {
    return ListView.builder(
        itemCount: controle.lista.length,
        itemBuilder: (context, index) {
          var todo = controle.lista[index];
          return ListTile(leading: Checkbox(value: todo.completed, onChanged: (value) {}), title: Text(todo.id.toString()));
        });
  }
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  manuziandoEstado(EstadoValue estado) {
    switch (estado) {
      case EstadoValue.inicio:
        return inicio();
      case EstadoValue.carregando:
        return carregando();
      case EstadoValue.erro:
        return erro();
      case EstadoValue.sucesso:
        return sucesso();
      default:
        return inicio();
    }
  }
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  @override
  void initState(){
      controle.iniciar();
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lista Api"), actions: [
          IconButton(
              onPressed: (){
                controle.iniciar();
              },
              icon: const Icon(Icons.refresh_outlined))
        ]),
        body: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return manuziandoEstado(controle.estado.value);
          },
        ));
  }
}

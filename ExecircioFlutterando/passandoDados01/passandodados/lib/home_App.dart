import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passandodados/dados_cadastrados.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() {
    return EstadoApp();
  }
}

class EstadoApp extends State<HomeApp> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController salario = TextEditingController();

  void salvarDados() {
    String nome1 = nome.text;
    int idade1 = int.parse(idade.text);
    String endereco1 = endereco.text;
    int telefone1 = int.parse(telefone.text);
    double salario1 = double.parse(salario.text);
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return  Dados(endereco: endereco1,nome: nome1,telefone: telefone1,salario: salario1,idade: idade1,);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            TextField(keyboardType: TextInputType.name, controller: nome, decoration: const InputDecoration(labelText: "nome", hintText: "nome", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: idade, decoration: const InputDecoration(labelText: "idade", hintText: "idade", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: endereco, decoration: const InputDecoration(hintText: "Endereço", labelText: "Endereço", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(
                keyboardType: TextInputType.phone,
                controller: telefone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Telefone",
                  labelText: "Telefone",
                )),
            const SizedBox(height: 10),
            TextField(
                controller: salario,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Salário",
                  labelText: "Salário",
                )),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  salvarDados();
                },
                child: const Text("SALVAR"))
          ],
        )),
      ),
    );
  }
}

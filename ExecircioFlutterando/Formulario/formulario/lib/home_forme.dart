import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulario/Tela_dados.dart';

class HomeForme extends StatefulWidget {
  const HomeForme({super.key});
  @override
  State<HomeForme> createState() {
    return HomeEstado();
  }
}

class HomeEstado extends State<HomeForme> {
  TextEditingController controleNome = TextEditingController();
  TextEditingController controleEmail = TextEditingController();
  TextEditingController controleSenha = TextEditingController();
  TextEditingController controllerConfirmaSenha = TextEditingController();

  void passandoDados() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TelaDados(nome: controleNome.text, email: controleEmail.text, senha: controleSenha.text, confirmaSenha: controllerConfirmaSenha.text);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Formulário")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(controller: controleNome, decoration: const InputDecoration(hintText: "Nome", labelText: "Nome", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person))),
                const SizedBox(height: 12),
                TextFormField(controller: controleEmail, decoration: const InputDecoration(hintText: "Email", labelText: "Email", border: OutlineInputBorder(), prefixIcon: Icon(Icons.email))),
                const SizedBox(height: 12),
                TextFormField(controller: controleSenha, decoration: const InputDecoration(hintText: "Senha", labelText: "Senha", border: OutlineInputBorder(), prefixIcon: Icon(Icons.vpn_key))),
                const SizedBox(height: 12),
                TextFormField(controller: controllerConfirmaSenha, decoration: const InputDecoration(hintText: "confirmaSenha", labelText: "ConfirmaSenha", border: OutlineInputBorder(), prefixIcon: Icon(Icons.vpn_key))),
                const SizedBox(height: 12),
                Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          passandoDados();
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Salvar"))),
                const SizedBox(height: 15),
                Container(width: double.infinity, height: 40, child: ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {}, icon: const Icon(Icons.restart_alt), label: const Text("resetar")))
              ],
            ),
          ),
        ));
  }
}

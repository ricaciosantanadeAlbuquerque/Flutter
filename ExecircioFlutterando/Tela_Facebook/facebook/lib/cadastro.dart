
import 'package:facebook/Modelo/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  // ============ gerencia de estado ==================;
  const Cadastro({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}
// ============================ Estado ========================================;

class Estado extends State<StatefulWidget> {
  // é necessário implementar o método build que é  herdado da classe state
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmaSenha = TextEditingController();

  @override
  Widget build(BuildContext contex) {
    
    return Scaffold(
        appBar: AppBar(title: const Text("Cadastro")),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: <Widget>[
                CampoTexto(
                  controle1: nome,
                  label: "Nome",
                  icon: Icons.person,
                  hint: "Digite seu nome."
                ),
                const SizedBox(height:15),
                CampoTexto(
                  controle1: email,
                  label: "Email",
                  icon: Icons.email,
                  hint: "Digite seu email."
                ),
                const SizedBox(height:15),
                CampoTexto(
                  controle1: senha,
                  label: "Senha",
                  icon: Icons.vpn_key,
                  hint: "Digite sua senha."
                ),
                const SizedBox(height:15),
                CampoTexto(
                  controle1: confirmaSenha,
                  label: "Confirmar Senha",
                  hint:  "Confirmar senha"
                  , icon: Icons.vpn_key
                  ),
                  const SizedBox(height:40),
                  SizedBox(
                    width:double.infinity,
                    height:50,
                    child:ElevatedButton.icon(
                      onPressed: (){
                          Usuario usuario = Usuario(nome1: nome.text,email1: email.text,senha1: senha.text,confirmaSenha1: confirmaSenha.text);
                          Navigator.of(context).pushNamed("inicio");
                          print(usuario.toString());
                      },
                       icon: const Icon(Icons.save), 
                       label: const Text("Salvar")
                       )
                  ),
                  const SizedBox(height:15),
                  SizedBox(
                    width:double.infinity,
                    height:50,
                    child:ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                      onPressed:(){
                      
                      }, 
                      icon: const Icon(Icons.restart_alt), 
                      label: const Text("Resetar")
                      )
                  )
        
              ]
              )
              ),
        )
            );
  }
}

// componentização do TextField()
class CampoTexto extends StatelessWidget {
  final TextEditingController controle1;
  final String? label;
  final IconData? icon;
  final String? hint;
  CampoTexto({super.key, required this.label, required this.icon,required this.hint, required this.controle1});

  @override
  Widget build(BuildContext context) {
    return TextField(
       controller: controle1,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon:  icon == null ? null : Icon(icon),
        border: const OutlineInputBorder(),
        //suffixIcon: const Icon(Icons.person_add)
      ),
    ); // textField() é uma entrada de texto ou numeros
  }
}

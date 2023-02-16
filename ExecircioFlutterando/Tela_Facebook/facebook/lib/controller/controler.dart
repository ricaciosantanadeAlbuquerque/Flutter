import 'package:flutter/cupertino.dart';

import '../Modelo/usuario.dart';

class Controle {
  static Usuario? dados;
  TextEditingController? nome;
  TextEditingController? email;
  TextEditingController? senha;
  TextEditingController? confirmaSenha;

  Controle({this.nome, this.email, this.senha, this.confirmaSenha}) {
    Usuario dados = Usuario(nome1: nome!.text, email1: email!.text, senha1: senha!.text, confirmaSenha1: confirmaSenha!.text);
    print(nome!.text);
  }

  void buscardados() {
    print(dados.toString());
  }
}

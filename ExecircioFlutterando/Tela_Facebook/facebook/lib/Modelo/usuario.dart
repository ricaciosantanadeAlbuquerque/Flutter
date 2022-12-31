// ignore_for_file: unnecessary_this

import 'package:facebook/cadastro.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class Usuario {
  
  String? nome;
  String? email;
  String? senha;
  String? confirmaSenha;

  Usuario({String? nome1, String? email1, String? senha1, String? confirmaSenha1}) {
    this.nome = nome1;
    this.email = email1;
    this.senha = senha1;
    this.confirmaSenha = confirmaSenha1;
    
  } // construtor

  String get getNome {
    return this.nome!;
  }

  set setNome(String nome) {
    this.nome = nome;
  }

  String get getEmail {
    return this.email!;
  }

  set setEmail(String emial) {
    this.email = emial;
  }

  String get getSenha {
    return this.senha!;
  }

  set setSenha(String senha) {
    this.senha = senha;
  }

  String get getConfirmaSenha {
    return this.confirmaSenha!;
  }

  set setConfirmaSenha(String confirmaSenha) {
    this.confirmaSenha = confirmaSenha;
  }

  @override
  String toString() {
    return "nome:${this.nome!}email:${this.email!}senha:${this.senha!}confirma senha: ${this.confirmaSenha!}";
  }
   
}

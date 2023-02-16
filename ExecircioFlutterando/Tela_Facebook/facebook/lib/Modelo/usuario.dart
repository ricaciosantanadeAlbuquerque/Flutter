// ignore_for_file: unnecessary_this

import 'package:facebook/view/cadastro.dart';
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

   print( "=====nome: ${this.nome!} email:${this.email!}senha:${this.senha!}confirma senha: ${this.confirmaSenha!}========");

  } // construtor

  String get getNome {
    return this.nome ?? ' valor não foi passado';
  }

  set setNome(String nome) {
    this.nome = nome;
  }

  String get getEmail {
    return this.email ?? ' valor não foi passado';
  }

  set setEmail(String emial) {
    this.email = emial;
  }

  String get getSenha {
    return this.senha ?? ' valor não foi passado';
  }

  set setSenha(String senha) {
    this.senha = senha;
  }

  String get getConfirmaSenha {
    return this.confirmaSenha ?? ' valor não foi passado';
  }

  set setConfirmaSenha(String confirmaSenha) {
    this.confirmaSenha = confirmaSenha;
  }

  @override
  String toString() {
    return "nome:${this.nome!}email:${this.email!}senha:${this.senha!}confirma senha: ${this.confirmaSenha!}";
  }
}

// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';

import '../model/Moeda.dart';

class Controller {
  
  TextEditingController? entrada; // recebe o objeto que virá da view
  TextEditingController? saida;

  List<Moeda>? lista; // recebe uma lista de objetos Moeda vindo Da classe Moeda
  Moeda? deMoeda;
  Moeda? paraMoeda;

  Controller({this.entrada, this.saida}) {
/**
 * Passamos atribultos do tipo TextEditingController  para poder receber objetos TextEditingController
 */
    lista = Moeda.getMoeda(); // recebe a lista da classe Moeda
    if (lista != null) {
      if (lista![0] != null && lista![1] != null) {
        deMoeda = lista![0];
        paraMoeda = lista![1];
      }
    }
  }

  void converter() {
    String entradaTexto = entrada!.text;
    double valorEntrada = double.tryParse(entradaTexto) ?? 1.0; // conversao
    double? valorRetorno;

    if (paraMoeda!.nome == "Real") {
      valorRetorno = valorEntrada * deMoeda!.real!;
    } else if (paraMoeda!.nome == "Dolar") {
      valorRetorno = valorEntrada * deMoeda!.dolar!;
    } else if (paraMoeda!.nome == "Euro") {
      valorRetorno = valorEntrada * deMoeda!.euro!;
    } else if (paraMoeda!.nome == "Bitcoin") {
      valorRetorno = valorEntrada * deMoeda!.bitcoin!;
    }

    saida!.text = valorRetorno!.toStringAsFixed(2); 

    // modificando o valor do atribulto nome do objeto saida !

  }
}

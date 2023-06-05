import 'package:flutter/material.dart';

import '../model/moeda.dart';

class Controle {
 final TextEditingController entrada;
  final TextEditingController saida;
  List<Moeda> lista = [];
  Moeda? de;
  Moeda? para;

  Controle({required this.entrada,required this.saida}) {
    lista = Moeda.pegarMoeda();
    de = lista[0];
    para = lista[1];
  }

  void converter() {
    String texto = entrada.text;
    double valeu = double.tryParse(texto.replaceAll(',','.')) ?? 1.0;
    double valorRetorno = 0;

    if (para!.nome == 'Real') {
      valorRetorno = valeu * de!.real;
    } else if (para!.nome == 'Dolar') {
      valorRetorno = valeu * de!.dolar;
    } else if (para!.nome == 'Euro') {
      valorRetorno = valeu * de!.euro;
    } else if (para!.nome == 'Iene') {
      valorRetorno = valeu * de!.iene;
    }
    saida.text = valorRetorno.toStringAsFixed(2);
  }
}

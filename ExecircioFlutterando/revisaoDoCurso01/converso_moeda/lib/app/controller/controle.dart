import 'package:flutter/material.dart';

import '../model/moeda.dart';

class Controle {
  TextEditingController entrada;
  TextEditingController saida;
  List<Moeda> lista = [];
  Moeda? de;
  Moeda? para;

  Controle({required this.entrada, required this.saida}) {
    lista = Moeda.getMoeda();
    de = lista[0];
    para = lista[1];
  }

  void converter() {
    String textoEntrada = entrada.text;
    double valor = double.tryParse(textoEntrada) ?? 1.0;
    double retornoValor = 0;

    if (para!.nome == 'Real') {
      retornoValor = valor * de!.real;
    } else if (para!.nome == 'Dolar') {
      retornoValor = valor * de!.dolar;
    } else if (para!.nome == 'Euro') {
      retornoValor = valor * de!.euro;
    }

    saida.text = retornoValor.toStringAsFixed(2);
  }
}

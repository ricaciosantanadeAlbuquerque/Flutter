import 'package:converso_moeda02/src/model/moeda.dart';
import 'package:flutter/material.dart';

class Controle {
  
  TextEditingController entrada;
  TextEditingController saida;
  List<Moeda> lista = [];
  Moeda? de;
  Moeda? para;

  Controle({required this.entrada, required this.saida}) {
    lista = Moeda.pegarMoeda();
    de = lista[0];
    para = lista[1];
  }

  void converter() {
    String texto = entrada.text;
    double valor = double.tryParse(texto) ?? 1.0;
    double retornoValor = 0;

    if (para!.name == 'Real') {
      retornoValor = valor * de!.real;
    } else if (para!.name == 'Dolar') {
      retornoValor = valor * de!.dolar;
    } else if (para!.name == 'Euro') {
      retornoValor = valor * de!.euro;
    }

    saida.text = retornoValor.toStringAsFixed(2);
  }
}

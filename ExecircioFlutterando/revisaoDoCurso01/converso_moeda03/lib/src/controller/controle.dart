import 'package:converso_moeda03/src/model/moeda.dart';
import 'package:flutter/material.dart';

class Controle {
  
  TextEditingController entrada;
  TextEditingController saida;
  List<Moeda> lista = [];
  Moeda? de;
  Moeda? para;

  Controle({required this.entrada, required this.saida}) {
    lista = Moeda.getMoeda(); // retorna uma lita de Moeda()
    de = lista[0];
    para = lista[1];
  }

  void converte() {
    String textoEntrada = entrada.text;
    double valor = double.tryParse(textoEntrada) ?? 1.0; // qualquer valor multiplicado por 1 é ele mesmo.
    double retorno = 0;

    if (para!.nome == 'Real') {
      retorno = valor * de!.real;
    } else if (para!.nome == 'Dolar') {
      retorno = valor * de!.dolar;
    } else if (para!.nome == 'Euro') {
      retorno = valor * de!.euro;
    }

    saida.text = retorno.toStringAsFixed(2);
  }
}

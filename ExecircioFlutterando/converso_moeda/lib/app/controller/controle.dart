import 'package:converso_moeda/app/model/moeda.dart';
import 'package:flutter/material.dart';

class Controle {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  List<Moeda> lista = [];
  Moeda? de;
  Moeda? para;

  Controle({required this.entrada, required this.saida}) {
    lista = Moeda.retornarListaMoeda(); // retorna uma lista de objetos moedas
    de = lista[0];
    para = lista[1];
  }

  void converter() {
    double valorEntrada = double.tryParse(entrada.text) ?? 1.0; // se vinher nulo multiplicar por 1 e fica o mesmo
    double valorSaida = 0;

    if (para!.nome == 'Real') {
      valorSaida = valorEntrada * de!.real;
    } else if (para!.nome == 'Dolar') {
      valorSaida = valorEntrada * de!.dolar;
    } else if (para!.nome == 'Real') {
      valorSaida = valorEntrada * de!.euro;
    }
    saida.text = valorSaida.toStringAsFixed(2);
  }
}

import 'package:converso_moeda/app/model/moeda.dart';
import 'package:flutter/material.dart';

class Controller {
  
  TextEditingController entrada;
  TextEditingController saida;
  List<Moeda> lista = [];
  Moeda? de;
  Moeda? para;

  Controller({required this.entrada, required this.saida}) {
    lista = Moeda.listaMoedas();
    de = lista[0];
    para = lista[1];
  }

  void converte() {
    String valorEntrada = entrada.text;
    double valor = double.tryParse(valorEntrada) ?? 1.0;
    double retorno = 0.0;

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

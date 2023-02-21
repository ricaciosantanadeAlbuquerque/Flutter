import 'package:converso05/app/models/moeda.dart';
import 'package:flutter/cupertino.dart';

class Controle {
  List<Moeda>? lista;
  Moeda? de;
  Moeda? para;
  TextEditingController entrada;
  TextEditingController saida;

  Controle({required this.entrada, required this.saida}) {
    lista = Moeda.getMoeda();
    de = lista![0];
    para = lista![1];
  }

  void converte() {
    String texto = entrada.text;
    double valeu = double.tryParse(texto) ?? 1.0;
    double valorRetorno = 0;

    if (para!.nome == "Real") {
      valorRetorno = valeu * de!.real;
    } else if (para!.nome == "Dolar") {
      valorRetorno = valeu * de!.dolar;
    } else if (para!.nome == "Euro") {
      valorRetorno = valeu * de!.dolar;
    }

    saida.text = valorRetorno.toStringAsFixed(2);
  }
}

import 'package:converso05/app/models/moeda.dart';
import 'package:flutter/cupertino.dart';

class Controle {
  List<Moeda>? lista;
  Moeda? de;
  Moeda? para;
  TextEditingController entrada;
  TextEditingController saida;

  Controle(this.entrada, this.saida) {
    lista = Moeda.getMoeda();
    de = lista![0];
    para = lista![1];
  }

  void converte() {
    String texto = entrada.text;
    double valeu = double.tryParse(texto) ?? 1.0;
    double valorRetorno;

    if (para!.nome == "Real") {
      valorRetorno = valeu * de!.real;
    } else if (para!.nome == "Dolar") {
      valorRetorno = valeu * de!.dolar;
    } else if (para!.nome == "Euro") {
      
    }
  }
}

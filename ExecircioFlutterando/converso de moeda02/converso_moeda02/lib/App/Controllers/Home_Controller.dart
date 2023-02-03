import 'package:converso_moeda02/App/model/Moeda_modelo.dart';
import 'package:flutter/cupertino.dart';

class HomeControlle {
  final  TextEditingController entrada;
  final TextEditingController saida;
  List<Moeda>? lista;
  Moeda? de; // é um atribulto do tipo Moeda  e pode receber  objetos Moeda
  Moeda? para;

  HomeControlle({required this.entrada, required this.saida}) { // inicializando os atribultos como parâmetro
    lista = Moeda.getMoeda(); // retorna uma lista de objetos Moeda
    if (lista != null) {
      if (lista![0] != null) {
        de = lista![0]; // 'de' recebe o objeto Moeda na possição zero do array lista que é o real
        para = lista![1]; // 'para' recebe o objeto Moeda na posição um do array lista que é o dolar

      }
    }
  }

  void converte() {
    String entradaTexto = entrada.text;
    double valorEntrada = double.tryParse(entradaTexto.replaceAll(",",".")) ?? 1.0;
    double valorRetorno = 0;

    if (para!.nome == "Real") {
      valorRetorno = valorEntrada * de!.real;
    } else if (para!.nome == "Dolar") {
      valorRetorno = valorEntrada * de!.dolar;
    } else if (para!.nome == "Euro") {
      valorRetorno = valorEntrada * de!.euro;
    } else if (para!.nome == "Bitcoin") {
      valorRetorno = valorEntrada * de!.bitcoin;
    }

    saida.text = valorRetorno.toStringAsFixed(2); // deve retornar para view
  }
}

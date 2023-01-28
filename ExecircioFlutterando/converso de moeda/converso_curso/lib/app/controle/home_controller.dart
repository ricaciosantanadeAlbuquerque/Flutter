import 'package:converso_curso/app/model/moeda_modelo.dart';
import 'package:flutter/cupertino.dart';

class Controle {
  final TextEditingController entrada;
  final TextEditingController saida;

  List<MoedaModelo>? moeda; // array do tipo MoedaModelo
  MoedaModelo? deMoeda; // atribulto do tipo MoedaModelo
  MoedaModelo? paraMoeda;

  Controle({required this.entrada, required this.saida}) {
    print(entrada.text);
  
    this.moeda = MoedaModelo.getMoeda();
    this.deMoeda = moeda![0];
    this.paraMoeda = moeda![1];
  }

  void converte() {
    String texto = entrada.text;
    // conversao
    double? valor = double.tryParse(texto.replaceAll(',','.')) ?? 1.0; // se for nulo  então atrivua a valor 1.0
    double valordeRetorno = 0.0;

    if (paraMoeda!.nome == "Real") {
      valordeRetorno = valor * deMoeda!.real; // not null
    } else if (paraMoeda!.nome == "Dolar") {
      valordeRetorno = valor * deMoeda!.dolar;
    } else if (paraMoeda!.nome == "Euro") {
      valordeRetorno = valor * deMoeda!.euro;
    } else if (paraMoeda!.nome == "Bitcoin") {
      valordeRetorno = valor * deMoeda!.bitcoin;
    }

    saida.text = valordeRetorno.toStringAsFixed(2);
  }
}

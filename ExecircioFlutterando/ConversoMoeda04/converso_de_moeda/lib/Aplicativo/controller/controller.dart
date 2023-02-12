import 'package:converso_de_moeda/Aplicativo/model/Moeda.dart';
import 'package:flutter/cupertino.dart';

class Controller {
  TextEditingController _entrada;
  TextEditingController _saida;
  List<Moeda>? lista;
  Moeda? deMoeda;
  Moeda? paraMoeda;

  Controller(this._entrada, this._saida) {
    lista = Moeda.getMoeda();
    deMoeda = lista![0];
    paraMoeda = lista![1];
  }

  void converter() {
    String texto = _entrada.text;
    double valorEntrada = double.tryParse(texto) ?? 1.0;
    double? valorRetorno;

    if (paraMoeda!.getNome == "Real") {
      valorRetorno = valorEntrada * deMoeda!.getReal;
    } else if (paraMoeda!.getNome == "Dolar") {
      valorRetorno = valorEntrada * deMoeda!.getDolar;
    } else if (paraMoeda!.getNome == "Euro") {
      valorRetorno = valorEntrada * deMoeda!.getEuro;
    } else if (paraMoeda!.getNome == "Bitcoin") {
      valorRetorno = valorEntrada * deMoeda!.getBitcoin;
    }

    this._saida.text = valorRetorno!.toStringAsFixed(2);
  }
}

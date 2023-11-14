import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class HomeControlle {
  final TextEditingController entrada;
  final TextEditingController saida;
  List<CurrencyModel>? listCurrencyModel;
  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  HomeControlle({required this.entrada, required this.saida}) {
    listCurrencyModel = CurrencyModel.listCurrencyModel;
    toCurrency = listCurrencyModel![0];
    fromCurrency = listCurrencyModel![1];
  }

  void convert() {
    String text = entrada.text;
    double valor = double.tryParse(text) ?? 1.0;
    double valorRetorno = 0;

    if (fromCurrency!.name == 'Real') {
      valorRetorno = valor * toCurrency!.real;
    } else if (fromCurrency!.name == 'Dolar') {
      valorRetorno = valor * toCurrency!.dolar;
    } else if (fromCurrency!.name == 'Euro') {
      valorRetorno = valor * toCurrency!.euro;
    } else if (fromCurrency!.name == 'Peso Argentino') {
      valorRetorno = valor * toCurrency!.pesoArgentino;
    }

    saida.text = valorRetorno.toStringAsFixed(2);
  }
}

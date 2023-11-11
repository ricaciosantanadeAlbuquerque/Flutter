import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class HomeController {
  
  final TextEditingController entrada;
  final TextEditingController saida;
  List<CurrencyModel>? listCurrencyModel;
  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  HomeController({required this.entrada, required this.saida}) {
    listCurrencyModel = CurrencyModel.listCurrencyModel;
    toCurrency = listCurrencyModel![0];
    fromCurrency = listCurrencyModel![1];
  }

  void convert() {
    String text = entrada.text;
    double value = double.tryParse(text) ?? 1.0;
    double retorno = 0;

    if (fromCurrency!.name == 'Real') {
      retorno = value * toCurrency!.real;
    } else if (fromCurrency!.name == 'Dolar') {
      retorno = value * toCurrency!.dolar;
    } else if (fromCurrency!.name == 'Euro') {
      retorno = value * toCurrency!.euro;
    }

    saida.text = retorno.toStringAsFixed(2);
  }
}

import 'package:converso_moeda55/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeControlle {
  List<CurrencyModel>? listCurrencyModel;
  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;
  TextEditingController entrada;
  TextEditingController saida;

  HomeControlle({required this.entrada, required this.saida}) {
    listCurrencyModel = CurrencyModel.listCurrencyModel;
    toCurrency = listCurrencyModel![0];
    fromCurrency = listCurrencyModel![1];
  }

  void convert() {
    String text = entrada.text;
    double valor = double.tryParse(text) ?? 1;
    double retorno = 0;

    if (fromCurrency!.name == 'Real') {
      retorno = valor * toCurrency!.real;
    } else if (fromCurrency!.name == 'Dolar') {
      retorno = valor * toCurrency!.dolar;
    } else if (fromCurrency!.name == 'Euro') {
      retorno = valor * toCurrency!.euro;
    }

    saida.text = retorno.toStringAsFixed(2);
  }
}

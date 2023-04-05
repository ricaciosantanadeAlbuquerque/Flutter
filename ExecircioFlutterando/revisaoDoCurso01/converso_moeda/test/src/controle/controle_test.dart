import 'package:converso_moeda/app/controller/controle.dart';
import 'package:converso_moeda/app/model/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();

  Controle controle = Controle(entrada: entrada, saida: saida);
  test('Convertendo de real para dolar', () {
    entrada.text = '1';
    controle.converter();
    expect(saida.text, '0.20');
  });
  test('Convertendo de dolar para real', () {
    entrada.text = '1';
    controle.de = Moeda(nome: 'Dolar', real: 5.07, dolar: 1.0, euro: 0.91);
    controle.para = Moeda(nome: 'Real', real: 1.0, dolar: 0.20, euro: 0.18);
    controle.converter();
    expect(saida.text, '5.07');
  });
}

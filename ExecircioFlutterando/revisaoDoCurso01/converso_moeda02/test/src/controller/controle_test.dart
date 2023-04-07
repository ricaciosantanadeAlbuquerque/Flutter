import 'package:converso_moeda02/src/controller/controle.dart';
import 'package:converso_moeda02/src/model/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controle controle = Controle(entrada: entrada, saida: saida);
  test('Testando converso Real para dolar', () {
    entrada.text = '2';
    controle.converter();
    expect(saida.text, '0.40');
  });

  test('Dolar para real', () {
    entrada.text = '1';
    controle.de = Moeda(name: 'Dolar', real: 5.07, dolar: 1.0, euro: 0.91);
    controle.para = Moeda(name: 'Real', real: 1.0, dolar: 0.20, euro: 0.18);
    controle.converter();
    expect(saida.text, '5.07');
  });
}

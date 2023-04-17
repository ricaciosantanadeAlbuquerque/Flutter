import 'package:converso_moeda/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controller controle = Controller(entrada: entrada, saida: saida);

  test('De real para dolar', () {
    entrada.text = '2';
    controle.converte();
    expect(saida.text, '0.40');
  });
}

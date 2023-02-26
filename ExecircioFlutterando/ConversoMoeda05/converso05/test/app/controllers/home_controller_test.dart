import 'package:converso05/app/controllers/controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /**
   * Teste Unitário;
   */
  final TextEditingController entrada = TextEditingController();
  final TextEditingController saida = TextEditingController();
  Controle controle = new Controle(entrada: entrada, saida: saida);
  test('convertendo de real para dolar', () {
    entrada.text = "2.0";
    controle.converte();
    expect(saida.text, '0.38');
  });
}

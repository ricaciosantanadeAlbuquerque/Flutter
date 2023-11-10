import 'package:converso_moeda55/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  final homeControlle = HomeControlle(entrada: entrada, saida: saida);

  test('deve converte de ral para dolar', () {
    entrada.text = '1';
    homeControlle.convert();

    expect(saida.text, '0.20');
  });
}

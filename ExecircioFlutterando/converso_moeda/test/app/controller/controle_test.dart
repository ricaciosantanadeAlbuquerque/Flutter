import 'package:converso_moeda/app/controller/controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controle controle = Controle(entrada: entrada, saida: saida);
  test('Testando o carregamento da lista', () {
    final lista1 = controle.lista;
    for (var j in lista1) {
      print(j.toString());
    }
    expect(lista1.isNotEmpty, true);
  });

  test('Testando Converso', () {
    entrada.text = '1';
    controle.converter();
    expect(saida.text, '0.20');
  });
}

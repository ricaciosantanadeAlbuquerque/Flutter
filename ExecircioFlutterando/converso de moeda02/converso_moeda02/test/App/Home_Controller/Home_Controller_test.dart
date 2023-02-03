import 'package:converso_moeda02/App/Controllers/Home_Controller.dart';
import 'package:converso_moeda02/App/model/Moeda_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  final controle = HomeControlle(entrada: entrada, saida: saida);

  test("Convertendo de real para dolar ", () {
    entrada.text = "2.0";
    controle.converte();
    expect(saida.text, "0.36");
  });

  // Segundo test

  test("Convertendo de dolar para real ", () {
    entrada.text = "1";
    controle.de = Moeda(nome: "Dolar", real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    controle.para = Moeda(nome: "Real", real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    controle.converte();
    expect(saida.text, "5.65");
  });
}

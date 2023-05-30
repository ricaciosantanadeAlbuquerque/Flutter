import 'package:consumo_dio/app/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('verificando se a lista esta carregada ', () async {
    await controle.inicio();
    expect(controle.lista.value.isNotEmpty, true);
  });

  test('Testando a gerencia de estado ', () async {
    expect(controle.estado.value, Estado.inicio);
    await controle.inicio();
    expect(controle.estado.value, Estado.sucesso);
  });
}

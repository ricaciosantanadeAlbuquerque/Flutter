import 'package:consumo_api_http/app/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle77 controle = Controle77();

  test('Testando a lista', () async {
    await controle.start();
    final lista = controle.lista.value;
    for (var api in lista) {
      print(api.toString());
    }
    expect(controle.lista.value.isNotEmpty, true);
  });

  test('testando o estado', () async {
    expect(controle.estado.value, Estado.inicio);
    await controle.start();
    expect(controle.estado.value, Estado.sucesso);
  });
}

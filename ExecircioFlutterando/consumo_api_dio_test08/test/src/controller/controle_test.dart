import 'package:consumo_api_dio_test08/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test(' Verificando se a lista não é vazia ', () async {
    await controle.iniciar();
    expect(controle.lista.isNotEmpty, true);
  });

  test('testando passagem de estado', () async {
    expect(controle.estado.value, Estado.inicio);
    await controle.iniciar();
    expect(controle.estado.value, Estado.sucesso);
  });
}

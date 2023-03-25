import 'package:consumo_api_http_test/src/controller/controlle.dart';
import 'package:consumo_api_http_test/src/model/Api.dart';
import 'package:consumo_api_http_test/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();
  Repository repository = Repository();

  test('Testando lista consumo ', () async {
    List<Api> lista = await repository.consumo();
    expect(lista.isNotEmpty, true);
  });

  test('Testando se a lista de controle esta carregada', () async {
    await controle.inicio();

    expect(controle.lista.isNotEmpty, true);
  });

  test('testando estado ', () async {
    expect(controle.estado, Estado.inicio);
    await controle.inicio();
    expect(controle.estado, Estado.sucesso);
  });

  test('testando erro', () async {
    expect(controle.estado, Estado.inicio);
    await controle.inicio();
    expect(controle.estado, Estado.erro);
  });
}

import 'package:consumo_api_http_test09/src/controller/controle.dart';
import 'package:consumo_api_http_test09/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();
  Repository repository = Repository();
  test('Verificando se a lista está carregada ', () async {
    await controle.iniciar();
    expect(controle.lista.value.isNotEmpty, true);
  });
}

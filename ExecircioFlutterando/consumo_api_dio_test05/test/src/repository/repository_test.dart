import 'package:consumo_api_dio_test05/src/controller/cotrole.dart';
import 'package:consumo_api_dio_test05/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Repository p = Repository();
  Controle controle = Controle();
  test('Trazendo uma lista de objetos ApiMap', () async {
    var lista = await p.consumo();
    expect(lista[1].id, 2);
  });

  test('verificando se a lista controle não e null ', () async {
    expect(controle.estado, Estado.start);
    await controle.inicio();
    expect(controle.estado, Estado.sucess);
    expect(controle.lista.isNotEmpty, true);
    expect(controle.lista[1].id, 2);
  });
}

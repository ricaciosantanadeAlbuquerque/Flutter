import 'package:consumo_api_dio_test07/src/controller/controle.dart';
import 'package:consumo_api_dio_test07/src/model/api.dart';
import 'package:consumo_api_dio_test07/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Controle controle = Controle();
  Repository repository = Repository();
  List<Api> lista = await repository.consumo();
   
  

  test('Testando um estado', () async {
    expect(controle.estado.value, EstadoValue.inicio);
    await controle.iniciar();
    expect(controle.estado.value, EstadoValue.sucesso);
   
  });
}

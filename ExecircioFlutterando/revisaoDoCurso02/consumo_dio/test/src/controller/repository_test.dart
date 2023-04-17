import 'package:consumo_dio/src/model/Api.dart';
import 'package:consumo_dio/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Repository repository = Repository();

  test('Carregando lista', () async {
    List<ApiJson> lista = await repository.consumo();
    for (var j in lista) {
      print(j.id.toString());
      
    }
  });
}

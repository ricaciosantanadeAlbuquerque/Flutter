import 'package:consumo_api_http01/src/model/api_map.dart';
import 'package:consumo_api_http01/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Repository repository = Repository();
  List<ApiMap> lista = [];
  test('Retornado uma lista de apiMap', () async {
    lista = await repository.consumo();

    for (var obj in lista) {
      print(obj.toString());
    }
  });
}

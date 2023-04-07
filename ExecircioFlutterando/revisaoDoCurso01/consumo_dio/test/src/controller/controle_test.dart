import 'package:consumo_dio/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('Carregando uma List<Api>', () async {
    await controle.start();

    for (var api in controle.lista.value) {
      print(api.id.toString());
    }
    expect(controle.lista.value.isNotEmpty, true);
  });

  test('Testando estado!', ()async{
    expect(controle.estado.value, EstadoTipo.inicio);
    await controle.start();
    expect(controle.estado.value, EstadoTipo.sucesso);
  });
}

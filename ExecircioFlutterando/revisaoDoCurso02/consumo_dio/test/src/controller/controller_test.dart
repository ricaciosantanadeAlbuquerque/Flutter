import 'package:consumo_dio/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('Carregando  lista', () async {
    await controle.start();
    for (var j in controle.lista.value) {
      print(j.id.toString());
    }
    expect(controle.lista.value.isNotEmpty, true);
  });
// ============== Gerencia de estado ===============.
  test('Estado', ()async{
    expect(controle.estado.value, EstadoJJ.inicio);
    await controle.start();
    expect(controle.estado.value, EstadoJJ.sucesso);
  });
}

void main() {
  printar(); // fluxo async rodando em paralelo ao fluxo principal.
  print(1);
  print(2);
  print(3);
}

Future<void> printar() async { 
  await Future.delayed(Duration(seconds: 2)); // await vamos esperar que esse fluxo acabe
  print(4);
}
/**
 * Enquanto  fluxo principal está em execução, em paralelo a ele está em execução o fluxo async 
 */
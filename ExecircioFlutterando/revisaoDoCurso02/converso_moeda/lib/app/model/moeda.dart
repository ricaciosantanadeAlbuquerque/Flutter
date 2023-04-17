class Moeda {
  String nome;
  double real;
  double dolar;
  double euro;

  Moeda({required this.nome, required this.real, required this.dolar, required this.euro});

  static List<Moeda> listaMoedas() {
    return [
      Moeda(nome: 'Real', real: 1.0, dolar: 0.20, euro: 0.19),
      Moeda(nome: 'Dolar', real: 4.91, dolar: 1.0, euro: 0.91),
      Moeda(nome: 'Euro', real: 5.40, dolar: 1.10, euro: 1.0)
    ];
  }
}

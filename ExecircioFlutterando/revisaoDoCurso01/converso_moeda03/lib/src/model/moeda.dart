class Moeda {
  
  final String nome;
  final double real;
  final double dolar;
  final double euro;

  Moeda({required this.nome, required this.real, required this.dolar, required this.euro});


  static List<Moeda> getMoeda() {
    return [
      Moeda(nome: 'Real', real: 1.0, dolar: 0.20, euro: 0.18),
      Moeda(nome: 'Dolar', real: 5.07, dolar: 1.0, euro: 0.91),
      Moeda(nome: 'Euro', real: 5.56, dolar: 1.10, euro: 1.0)
    ];
  }
}

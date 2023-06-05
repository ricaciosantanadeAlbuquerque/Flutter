class Moeda {
  // classe imutável

  final String nome;
  final double real;
  final double dolar;
  final double euro;
  final double iene;

  const Moeda({required this.nome, required this.real, required this.dolar, required this.euro, required this.iene});

  static List<Moeda> pegarMoeda() {
    return const [
       Moeda(nome: 'Real', real: 1.00, dolar: 0.20, euro: 0.19, iene: 28.35),
       Moeda(nome: 'Dolar', real: 4.92, dolar: 1.00, euro: 0.93, iene: 139.57),
       Moeda(nome: 'Euro', real:5.28 , dolar:1.07 , euro:1.00, iene:149.57),
       Moeda(nome: 'Iene', real: 0.04, dolar: 0.01, euro: 0.01, iene: 1.00),
    ];
  }
}

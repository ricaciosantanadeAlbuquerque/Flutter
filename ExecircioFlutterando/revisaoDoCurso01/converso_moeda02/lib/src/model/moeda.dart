class Moeda {
  
  final String name;
  final double real;
  final double dolar;
  final double euro;

  Moeda({required this.name, required this.real, required this.dolar, required this.euro});

  static List<Moeda> pegarMoeda(){
    return [
      Moeda(name: 'Real', real: 1.0, dolar: 0.20, euro: 0.18),
      Moeda(name: 'Dolar', real: 5.07, dolar: 1.0, euro: 0.91),
      Moeda(name: 'Euro', real: 5.56, dolar: 1.10, euro: 1.0)
    ];
  }
}

class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double pesoArgentino;

  const CurrencyModel({required this.name, required this.real, required this.dolar, required this.euro, required this.pesoArgentino});

  static List<CurrencyModel> get listCurrencyModel {
    return const [
      CurrencyModel(name: 'Real', real: 1, dolar: 0.20, euro: 0.19, pesoArgentino: 71.43),
      CurrencyModel(name: 'Dolar', real: 4.90, dolar: 1, euro: 0.93, pesoArgentino: 350.13),
      CurrencyModel(name: 'Euro', real: 5.25, dolar: 1.07, euro: 1, pesoArgentino: 374.81),
      CurrencyModel(name: 'Peso Argentino', real: 0.14, dolar: 0.003, euro: 0.003, pesoArgentino: 1),
    ];
  }
}

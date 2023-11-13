class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double pesoArgentino;

  CurrencyModel({required this.name, required this.real, required this.dolar, required this.euro, required this.pesoArgentino});

  List<CurrencyModel> get listCurrencyModel {
    return [
      CurrencyModel(name: 'Real', real: 1, dolar: 0.20, euro: 0.19, pesoArgentino: 71.43),
      CurrencyModel(name: 'Dolar', real: 4.91, dolar: 1, euro: 0.93, pesoArgentino: 350.53),
      CurrencyModel(name: 'Euro', real: 5.25, dolar: 1.07, euro: 1, pesoArgentino: 375.10),
      CurrencyModel(name: 'Peso Argentino', real: 0.014, dolar: 0.005, euro: 0.003, pesoArgentino: pesoArgentino),
    ];
  }
}

class CurrencyModel {

  final String name;
  final double real;
  final double dolar;
  final double euro;

  const CurrencyModel({required this.name, required this.real, required this.dolar, required this.euro});

  static List<CurrencyModel> get listCurrencyModel{
    return const [
      CurrencyModel(name: 'Real', real: 1, dolar: 0.20, euro: 0.19),
      CurrencyModel(name: 'Dolar', real: 4.91, dolar: 1, euro: 0.94),
      CurrencyModel(name: 'Euro', real: 5.25, dolar:1.07 , euro: 1),
    ];
  }

}

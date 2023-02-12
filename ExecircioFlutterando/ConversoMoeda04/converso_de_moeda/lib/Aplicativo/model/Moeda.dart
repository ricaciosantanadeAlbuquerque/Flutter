class Moeda {
  String? _nome;
  double? _real;
  double? _dolar;
  double? _euro;
  double? _bitcoin;

  Moeda({required String nome, required double real, required double dolar, required double euro, required double bitcoin}) {
    this._nome = (nome != null) ? nome : ' Valor não informado ';
    this._real = (real != null) ? real : 0.0;
    this._dolar = (dolar != null) ? dolar : 0.0;
    this._euro = (euro != null) ? euro : 0.0;
    this._bitcoin = (bitcoin != null) ? bitcoin : 0.0;
  }

  static List<Moeda> getMoeda() {
    return [
      Moeda(nome: "Real", real: 1.0, dolar: 0.20, euro: 0.18, bitcoin: 0.000016),
      Moeda(nome: "Dolar", real: 5.06, dolar: 1.0, euro: 0.91, bitcoin: 0.000088),
      Moeda(nome: "Euro", real: 5.57, dolar: 1.10, euro: 1.0, bitcoin: 0.00010),
      Moeda(nome: "Bitcoin", real: 64116.51, dolar: 11351.30, euro: 9689.54, bitcoin: 1.0)
    ];
  }

  String get getNome => this._nome ?? ' valor não informado ';

  void set setNome(String nome) => this._nome = (nome != null) ? nome : this._nome;

  double get getReal => this._real ?? 0.0;

  void set setReal(double real) => this._real = (real != null) ? real : this._real;

  double get getDolar => this._dolar ?? 0.0;

  void set setDolar(double dolar) => this._dolar = (dolar != null) ? dolar : this._dolar;

  double get getEuro => this._euro ?? 0.0;

  void set setEuro(double euro) => this._euro = (euro != null) ? euro : this._euro;

  double get getBitcoin => this._bitcoin ?? 0.0;

  void set setBitcoin(double bitcoin) => this._bitcoin = (bitcoin != null) ? bitcoin : this._bitcoin;
}

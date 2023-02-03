class Moeda {
  String? nome;
  double? real;
  double? dolar;
  double? euro;
  double? bitcoin;

  Moeda({String? nome, double? real, double? euro, double? dolar, double? bitcoin}) { 
    // Método com o nome da classe construtor
    // o tratamento será feito com ternário

    this.nome = (nome != null) ? nome : 'Valor não informado ';
    this.real = (real != null) ? real : 0.0;
    this.dolar = (dolar != null) ? dolar : 0.0;
    this.euro = (euro != null) ? euro : 0.0;
    this.bitcoin = (bitcoin != null) ? bitcoin : 0.0;
  }

   static List<Moeda> getMoeda() { // retorna uma lista de objetos moeda 
    return [
      Moeda(nome:"Real",real: 1.0, dolar: 0.20,euro: 0.18,bitcoin:0.000016),
      Moeda(nome:"Dolar",real: 5.06,dolar: 1.0,euro: 0.91,bitcoin:0.000088),
      Moeda(nome:"Euro",real:5.57,dolar:1.10,euro:1.10,bitcoin: 0.00010),
      Moeda(nome:"bitcoin",real:64116.51,dolar: 11351.30,euro:9689.54,bitcoin: 1)
    ];
  }
}

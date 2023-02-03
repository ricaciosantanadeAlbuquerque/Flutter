class Moeda {
  /**
   * Os atribultos com o modificador final geralmente são inicializados pelo construtor da classe, mas não é uma regra.
   */
  final String nome;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  Moeda({required this.nome, required this.real, required this.dolar, required this.euro, required this.bitcoin});

  static List<Moeda> getMoeda() {
    return <Moeda>[
      Moeda(nome:"Real",real: 1.0,dolar:0.20,euro:0.18,bitcoin:0.000016),
      Moeda(nome: "Dolar", real: 5.06, dolar: 1.0, euro: 0.91, bitcoin: 0.000088),
      Moeda(nome:"Euro",real: 5.57,dolar:1.10,euro:1.0,bitcoin: 0.00010),
      Moeda(nome:"Bitcoin",real:64116.51,dolar: 11351.30,euro:9689.54,bitcoin:1)
    ];
  }
}

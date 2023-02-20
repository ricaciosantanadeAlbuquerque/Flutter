class Moeda {
  // atribultos de classe
  final String nome;
  final double real;
  final double dolar;
  final double euro;
  

  Moeda({required this.nome, required this.real, required this.dolar, required this.euro }); // construtor

  static List<Moeda> getMoeda(){ // funcao de classe
    return <Moeda>[
      Moeda(nome: 'Real', real: 1.0, dolar: 0.19, euro:0.18 ),
      Moeda(nome:"Dolar",real:5.17,dolar: 1.0,euro: 0.94 ),
      Moeda(nome:"Euro",real: 5.52,dolar: 1.07,euro: 1.0 ),
      
    ];
  }
}

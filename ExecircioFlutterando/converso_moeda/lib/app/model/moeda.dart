class Moeda {
  // classe imutável

  final String _nome;
  final double _real;
  final double _dolar;
  final double _euro;

  const Moeda(this._nome, this._real, this._dolar, this._euro);

  static List<Moeda> retornarListaMoeda() {
    return const [
      Moeda('Real', 1.0, 0.20, 0.18),
      Moeda('Dolar', 5.00, 1.0, 0.90),
      Moeda('Euro', 5.53, 1.11, 1.0),
    ];
  }

// get =============================================================
  String get nome {
    return _nome;
  }

  double get real {
    return _real;
  }

  double get dolar {
    return _dolar;
  }

  double get euro {
    return _euro;
  }
  @override
  String toString() => 'nome: $_nome, Real:$_real, Dolar:$_dolar, euro:$_euro';
}

class Produto{
  int? id;
  String? produto = "";
  bool? marcado1 = false;
  int? marcado;
 

  Produto({this.produto, this.marcado1}); 

  String? get getProduto => this.produto;

  set setProduto(String? produto) => this.produto = produto;

  get getMarcado => this.marcado1;

  set setMarcado( marcado) => this.marcado1 = marcado;


 // Método para converte o objeto produto em Map{}
  Map<String,dynamic> topMap(){
   
    var map =  <String,dynamic>{};
    map['id'] = id;
    map['produto'] = this.produto;
    //map['marcado'] = this.marcado1;

    return map;
  }

  // Convertendo map em objeto

  Produto.toProduto (Map<String,dynamic> map){
    this.id = map['id'];
    this.produto = map['produto'];
    //this.marcado = map['marcado'];

    

  }




}
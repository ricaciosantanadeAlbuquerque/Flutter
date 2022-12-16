class Login{
  static Login instancia = Login();
  String email = "";
  String senha = "";

  

    get getEmail{
      return this.email;
    }

    set setEmail(email){
      this.email = email;
    }

  get getSenha{
    return this.senha;
  }

  set setSenha(senha){
    this.senha = senha;
  }

    


}
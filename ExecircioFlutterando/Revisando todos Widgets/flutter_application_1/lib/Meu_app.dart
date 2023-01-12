import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeuAppInicio extends StatefulWidget {
  const MeuAppInicio({super.key});

  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}
//==============Estado==============================
class Estado extends State<StatefulWidget> {
  TextEditingController login = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
           SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/imagem/1.jpg",
              fit:BoxFit.cover
            )
           ),componentes(p: login,j: senha)
        ]
      )
    );
  }
  // componentizando =================================================
  Widget componentes({TextEditingController? p, TextEditingController? j}){
    return Container(
      child:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height:100,
              child: Image.asset("assets/imagem/logo.jpg")
            ),
            const SizedBox(height:15),
            Card(
              child:Column(
                children: <Widget> [
                  Padding(
                    padding:const EdgeInsets.only(top:20,left:12,right:12,bottom:5),
                    child: TextField(
                      controller: p,
                       decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Login",
                        labelText: "Email",
                       ),
                       keyboardType:TextInputType.emailAddress
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5,left:12,right:12,bottom:20),
                    child: TextField(
                      obscureText:true,
                      controller: j,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:"Senha",
                        hintText:"senha"
                      )
                    )
                  ),
                  Container(
                    width:double.infinity,
                    child: ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
                      ),
                      onPressed:(){
                        if(p?.text == "r" && j?.text == "1"){
                          print(p);
                          print(j);
                          Navigator.of(context).pushReplacementNamed("p");
                        }
                      },
                      child: const Text("Entrar")
                    ),
                  )

                ]
              )
            )
          ]
        ),
      )
    );
  }
}

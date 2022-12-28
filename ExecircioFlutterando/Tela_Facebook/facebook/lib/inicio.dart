import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 
 */

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<StatefulWidget> createState() { // implementamos o método createState() pertencente a classe StatefulWidget
    return Estado();
  }
}

// estado gerenciavel ===========================

class Estado extends State<StatefulWidget> {// criamos a calsse estado que extende da classe State<> que é do

final TextEditingController email = TextEditingController();
final TextEditingController senha = TextEditingController();
 bool verdade = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               color:const Color.fromARGB(255, 12, 49, 196)
              ),
              Container(
                child: Column(
                  children: [
                     Container( // primeiro elemento  da coluna ===================
                        margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                       child: const Center(
                        child: Text("facebook",
                        style:TextStyle(
                          color: Colors.white,
                          fontSize:50,
                          fontFamily:"Roboto-Bold"
                        )
                        )
                    ),
                     ),
        
                     Container(
                      
                        child: Column(
                          children: <Widget> [
                            const SizedBox(height:50),
                            Container(
                              width:370,
                              child: TextField(
                                 controller: email ,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                  labelText:"Email",
                                  hintText:"name@gmail.com",
                                  fillColor: Colors.white,
                                  filled: true  // Para que a cor de fundo seja ativada é necessário filled: true
                                )
                              ),
                            ),
                            const SizedBox(height:15),
                            Container(
                              width:370,
                              child: TextField(
                                controller:  senha,
                                decoration: InputDecoration(
                                 border: const OutlineInputBorder(),
                                  hintText:"Senha",
                                  fillColor:Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                    onPressed: (){}, icon: verdade ? Icon(Icons.visibility_off):Icon(Icons.visibility))
                                )
                              ),
                            ),
                             const SizedBox(height: 15),
                            
                               Card(
                                color: const Color.fromARGB(255, 1, 17, 192),
                                shape: RoundedRectangleBorder(
                                  borderRadius:BorderRadius.circular(2)
                                ),
                                 child: Container(
                                  width: 370,
                                  height:56,
                                  color: const Color.fromARGB(255, 1, 17, 192),
                                  child: TextButton(onPressed: () { 
                               
                                   },
                                  child: const Text(
                                    "Login",
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontFamily: "Roboto-Bold"
                                      )
                                      )
                                      ,)
                                                             ),
                               ),

                               Container(
                                margin:const EdgeInsets.fromLTRB(0,120,0,0),
                                child: Center(
                                  child:GestureDetector(
                                    child: const Text("Registrar-se no Facebook",style:TextStyle(
                                      color:Colors.white,
                                      fontSize:14,
                                      fontFamily:""
                                    )),
                                    onTap:(){}
                                    ),
                                ),
                               ),
                               Container(
                                margin:const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                width:40,
                                height:40,
                                child: Card(
                                  child: Image.asset("assets/icon/questao.png",
                                  color: const Color.fromARGB(255, 1, 17, 192),
                                  ),
                                )
                               )
                            
                          ]
                        )
                      
                     )
                  ],
                ),
              )
            ]
          ),
        )
    );
  }
}

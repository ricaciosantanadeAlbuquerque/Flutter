import 'package:flutter/material.dart';
import 'package:tela_login_navegacao/botao.dart';
import 'package:tela_login_navegacao/texto.dart';
import 'package:tela_login_navegacao/texto2.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/fundo.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Container(
            child: Center(
          child: Column(
              //mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      top: 250,
                    ),
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/logo.png',
                      color: Colors.white,
                    ),
                    ),
                Card(child: 
                Padding(
                  padding:const EdgeInsets.all(20),
                  child: Column(
                    children:
                   [
                    const SizedBox(height:10),
                    Texto(controle: login,),
                    Texto2(controle: senha),
                    const SizedBox(height:15),
                    Botao(funcao: (){
                      if(login.text == 'ricacio' && senha.text == '123'){
                        
                      }else{

                      }
                    })
                    ],
                    ),
                ))
              ]),
        ))
      ]),
    );
  }
}

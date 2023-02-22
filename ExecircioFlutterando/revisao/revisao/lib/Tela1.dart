import 'package:flutter/material.dart';

class Tela1 extends StatefulWidget {
  @override
  State<Tela1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Tela1> {
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/fundo.png",
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit:BoxFit.cover
          ),
          corpo()
        ]
      ),
    );
  }

  Widget corpo(){
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height:100,
            child:Image.asset("assets/logo.jpg")
          ),
          const SizedBox(height:10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(              
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: login,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"Login"
                    )
                  ),
                  const SizedBox(height:10),
                  TextField(
                    obscureText:true,
                    controller:senha,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"Senha"
                    )
                  ),
                  Container(
                    height:20
                  ),
                  SizedBox(
                    width:double.infinity,
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                      onPressed:(){
                      
                    },child: const Text("Entrar"),),
                  )
                ]
              ),
            )
          )
        ],
      ),
    );
  }
}

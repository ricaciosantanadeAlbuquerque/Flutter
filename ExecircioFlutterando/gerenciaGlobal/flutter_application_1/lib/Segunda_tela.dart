import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controle.dart';

class Tela2 extends StatefulWidget {
  const Tela2({super.key});
  @override
  State<StatefulWidget> createState() {
    return EstadoTela2();
  }
}

// estado ======================================================================
class EstadoTela2 extends State<StatefulWidget> {
  int cont = 0; // é necessário inicializar avariável ou fazer ela aceitar null type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Gerencia de Estado Global !")
          ),
          actions:[Escolha()]
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
          
              GestureDetector(
                  child: Text("Contador: $cont"),
                  onTap: () {
                    setState(() {
                      cont++;
                    });
                  }),
              const SizedBox(height: 10),
              Escolha(),
              const SizedBox(height:15),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Container(
                    width:50,
                    height:50,
                    color: Colors.black
                  ),
                  Container(
                    width: 50,
                    height:50,
                    color:Colors.black
                  ),
                  Container(
                    width:50,
                    height:50,
                    color:Colors.black
                  )
                ]
              )
            ]
            )
            ),
            floatingActionButton:FloatingActionButton(
              onPressed:(){
                setState((){
                  cont++;
                });
              },
              child:const Icon(Icons.add)
            )
            );
  }
}

// componentinzando =================================================================

class Escolha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Controle.instancia.valor,
     onChanged: (valeu){
      Controle.instancia.mudarValor();
    });
  }
}

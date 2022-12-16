import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controle.dart';

class SegundaTela extends StatefulWidget{
    const SegundaTela({super.key});

    @override
    State<StatefulWidget> createState(){
      return Estado();
    }
}

class Estado extends State<StatefulWidget>{
  Widget _escolha(){
 return  Switch(
                value:Controle.instancia.getVerdade,
                onChanged:(value){
                      Controle.instancia.troca();
                }
              );
  }
   int cont = 0;
   Widget build(BuildContext context){
      return Scaffold(
        drawer:Drawer(
            child:Column(
              children:  <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network("https://scontent.fjpa2-1.fna.fbcdn.net/v/t39.30808-6/283046171_7411184308953772_4456141829270858553_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEU8QjkHQ--WRi0c3ybVDbv3pHasxCjwVLekdqzEKPBUjNprE-bdiv8si3S2csr82Iu7xRzVHYMvEWy3dvqH2DN&_nc_ohc=4QVeeKNVKY4AX_EGzoN&_nc_ht=scontent.fjpa2-1.fna&oh=00_AfDsiur2Il0m50LFv4XfecmUTGljXDC6m2SpOR9xabFiBg&oe=6364F07E")), 
                  accountEmail: const Text("ricaciozz@gmail.com",)
                  ,accountName: const Text("ricacio") 
                  ),
                ListTile(
                  leading:const Icon(Icons.home),
                  title: const Text("ricacio"),
                  subtitle:const Text("Santana"),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Voltar"),
                  subtitle: const Text("sair"),
                  onTap:(){
                    Navigator.of(context).pushNamed("/");
                  }
                )
              ]
            )
        ),
        appBar:AppBar(
          title:const Text("Menu"),
          actions: <Widget> [_escolha()]
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text("Contador $cont"),
              Container(height:10),
              _escolha(),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width:100,
                    height:100,
                    color:Colors.black
                  ),
                  Container(
                    height:100,
                    width:100,
                    color:Colors.black
                  ),
                  Container(
                    height:100,
                    width: 100,
                    color:Colors.black
                  )
                ],
                )
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            setState(() {
              cont++;
            });
          }, // função anonima que executa um setState((){})
          child: const Icon(Icons.add)
          )
      );
    }
}
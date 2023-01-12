import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controle_app.dart';

class Tela2 extends StatefulWidget {
  const Tela2({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado2();
  }
}

// ============= Estad2=========================

class Estado2 extends State<StatefulWidget> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
      

        child:Column(
          children:<Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius:BorderRadius.circular(40),
              child:Image.network("https://scontent.fjpa2-1.fna.fbcdn.net/v/t39.30808-6/283046171_7411184308953772_4456141829270858553_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEU8QjkHQ--WRi0c3ybVDbv3pHasxCjwVLekdqzEKPBUjNprE-bdiv8si3S2csr82Iu7xRzVHYMvEWy3dvqH2DN&_nc_ohc=FwPrk0wtVjkAX_WQvkF&_nc_ht=scontent.fjpa2-1.fna&oh=00_AfApiuwSd8nkmHegGRD3zVhr5qgie35GpryPjSFLDaRYUw&oe=63C5D6BE")
            ),
            accountName: const Text("Ricacio"), 
            accountEmail:const Text("ricaciozz@gmail.com")
            ),
            
            const ListTile(
              leading: Icon(Icons.home),
              title:  Text("Inicio"),
            ),
            ListTile(
              leading:const Icon(Icons.exit_to_app),
              title:const Text("Sair"),
              onTap:(){
                Navigator.of(context).pushReplacementNamed("/");
              }
            )
          ]
        )
      ),
      appBar:AppBar(
        title:const Center(child:  Text("Tela2"),
        
        ),
        actions:<Widget>[escolha()]
      ),
      body:Container(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget>[
            GestureDetector(
              child:Text("contando: $cont"),
              onTap:(){
                setState(() {
                  cont++;
                });
              }
            ),
            const SizedBox(height:10),
            escolha(),
            const SizedBox(),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children:<Widget> [
              Container(
                width:50,
                height:50,
                color:Colors.black
              ),
               Container(
                width:50,
                height:50,
                color:Colors.black
              ),
               Container(
                width:50,
                height:50,
                color:Colors.black
              ),
            ],)

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
  // componentizando ========================================================
  Widget escolha(){
    return Switch(
      value: Controle.instancia.valor,
      onChanged:(value){
        Controle.instancia.mudarValor();
      }
    );
  }
}

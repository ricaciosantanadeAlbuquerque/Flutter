import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagina extends StatefulWidget{
   const Pagina({super.key});
   @override
    State<StatefulWidget> createState(){
        return Estado() ;
    }
}

//==============================================================================================

class Estado extends State<StatefulWidget>{
@override
 Widget build(BuildContext context){
  return Scaffold(
    drawer:Drawer(
      child: Column(
        children:<Widget>[
           UserAccountsDrawerHeader(
            currentAccountPicture:ClipRRect(
              borderRadius:BorderRadius.circular(40),
              child: Image.network("https://scontent.fjpa15-1.fna.fbcdn.net/v/t39.30808-6/283046171_7411184308953772_4456141829270858553_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEU8QjkHQ--WRi0c3ybVDbv3pHasxCjwVLekdqzEKPBUjNprE-bdiv8si3S2csr82Iu7xRzVHYMvEWy3dvqH2DN&_nc_ohc=QZB_K9dR0isAX8Farin&_nc_ht=scontent.fjpa15-1.fna&oh=00_AfBM1_zD-0Gg4-5NC6EOMInLW9YWUjXlZxgWAmoHREBvTw&oe=6362F63E")),
            accountName:  Text( "ricacio"),
             accountEmail:Text("ricaciozz@gmail.com")),
          ListTile( // recebe uma lista de widget já pre definida
            leading: const Icon(Icons.home), //  define o inco na esquerda
            title:const Text("Inicio"),
            subtitle: const Text("Tela Inicio"),
            onTap:(){

            }
          ),
           ListTile(
            leading:const Icon(Icons.home),
            title: const Text("Sair"),
            subtitle:const Text("Finalizar"),
            onTap:(){}
          )
        ]
      ),
    ),
    appBar:AppBar(
      title: const Text("Meu_App")
    ),
    body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.height,
            child: Image.asset("assets/plano.png",fit:BoxFit.cover)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                            width:200,
                            child: Image.asset("assets/up.png"),
                          ),
                ),
              Container(
                width:double.infinity,
                height:200,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                          TextField(
                            onChanged:(text){
                              
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                            )
                          ),
                          Container(
                            height:10
                          ),
                          TextField(
                            onChanged:(text){
    
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:"Senha",
                            )
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
    
                              },
                               child: const Text("Entrar")
                               ),
                          )
                      ],
                    ),
                  )
                ),
              ),
            ],
          )
        ]
      ),
    )
  );
 }
}
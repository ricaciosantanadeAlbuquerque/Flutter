import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});

  @override
Widget build(BuildContext context){
  return MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red
    ),
    home: const Pagina(),
  );
}
}

class Pagina extends StatefulWidget{
   const Pagina({super.key});
  @override
State<StatefulWidget>createState(){
  return Estado();
}
}


class Estado extends State<StatefulWidget>{
  Widget _corpo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width:100,
          height:100,
          child: Image.asset("assets/logo.png"),
          margin: const EdgeInsets.all(20)
        ),
        Card(
          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                TextField(
            onChanged: (text){

            },
            decoration: const InputDecoration(
              border:OutlineInputBorder(),
              labelText:"Email",
            ),
        ),
        Container(
            height:10
        ),
        TextField(
            onChanged: (text){
              
            },
            obscureText:true,
            decoration: const InputDecoration(
              border:OutlineInputBorder(),
              labelText:"Senha"
            ),
        ),
        Container(
          width:double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(onPressed: (){}, child:const Text("Entrar")),
          ),
        )
              ]
            ),
          )
        )
      ]
    );
  }
  @override
Widget build(BuildContext context){
  return Scaffold(
    drawer: Drawer(
      child: Column(
        children:  <Widget> [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network("https://scontent.fjpa2-1.fna.fbcdn.net/v/t39.30808-6/283046171_7411184308953772_4456141829270858553_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEU8QjkHQ--WRi0c3ybVDbv3pHasxCjwVLekdqzEKPBUjNprE-bdiv8si3S2csr82Iu7xRzVHYMvEWy3dvqH2DN&_nc_ohc=QZB_K9dR0isAX_UTQ40&_nc_ht=scontent.fjpa2-1.fna&oh=00_AfAtwBq8h1Jh6ZFcGvM0hJlXtQZpLn8aWIN1Le2-D9KRCA&oe=6360FBFE")),
            accountName: Text("ricacio"), 
            accountEmail: Text("ricaciozz@gmail.com")
            ),
           ListTile(
            leading: Icon(Icons.home),
            title:  Text("Iniciar"),
            subtitle: Text("Tela Inicio"),
            onTap:(){
              print("Inicio");
            }
           ),
           ListTile(
            leading: Icon(Icons.home),
            title: Text("Sair"),
            subtitle: Text("voltar"),
            onTap:(){
              print("Voltando");
            }

           )
        ]
      ),
    ),
    appBar: AppBar(
      title: const Center(
        child:  Text("Menu")
      )
    ),
    body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/fundo.png",fit:BoxFit.cover)
              ),
               _corpo()
        ]
      ),
    )
  );
}
}
import 'package:exercitando/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<StatefulWidget> {
  int cont = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(children: <Widget>[
        UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    "https://scontent.fjpa2-1.fna.fbcdn.net/v/t39.30808-6/283046171_7411184308953772_4456141829270858553_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEU8QjkHQ--WRi0c3ybVDbv3pHasxCjwVLekdqzEKPBUjNprE-bdiv8si3S2csr82Iu7xRzVHYMvEWy3dvqH2DN&_nc_ohc=C7BGN7Ge1pAAX-bmVK_&_nc_ht=scontent.fjpa2-1.fna&oh=00_AfCuMEk3PNEbhjehHYha3Y6p6eEX9Ao3EHWWRYjyeNezlA&oe=63A4387E",
                    fit: BoxFit.cover)),
            accountName: const Text("Ricacio Santana de Albuquerque"),
            accountEmail: const Text("ricaciozz@gmail.com")),
        ListTile(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/");
                },
                icon: const Icon(Icons.home)
                ),
                title: const Text("Saindo")
                ),
                ListTile(
                  trailing: const Icon(Icons.delete),
                  onTap: (){
                    setState(() {
                         Navigator.of(context).pushReplacementNamed("/");
                    });
                  },
                )
      ]
      )
      ),
      appBar: AppBar(
        title:const Center(
          child: Text(" Segunda tela")
        )
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text("Contador $cont"),
            onTap: () {
              setState(() {
                cont++;
              });
            },
          ),
          const SizedBox(height: 10),
          mudar(),
          Container(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
            Container(height: 50, width: 50, color: Colors.black),
            Container(color: Colors.black, width: 50, height: 50),
            Container(
              color: Colors.black,
              width: 50,
              height: 50,
            )
          ])
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              cont++;
            });
          },
          child: const Icon(Icons.add)),
    );
  }

//==========================================================================================================================
  Widget mudar() {
    return Switch(
      value: Singleton.instancia.logico,
      onChanged: (valeu) {
        setState(() {
          Singleton.instancia.mudar();
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tela_widget/home_app.dart';

import 'controle_Singleton.dart';

class Tela2 extends StatefulWidget {

  TextEditingController? login = TextEditingController();
  TextEditingController? senha = TextEditingController();

  Tela2({super.key,  this.login,  this.senha}) {
    this.login ?? 'Erro';
    this.senha ?? 'Erro';
  }

  @override
  State<Tela2> createState() {
    return Estado2();
  }
}

class Estado2 extends State<Tela2> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: ClipOval(
                    child: Image.network(
                        'https://scontent.fjpa2-1.fna.fbcdn.net/v/t39.30808-6/330536043_771147664085643_3276405348502146724_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGOWrQrvP-64u1hcso9oZIljErK4haKMiCMSsriFooyIGX1gWee-EI2AxBDmX2lFeUQfqdB-W55UseunYLLsj-A&_nc_ohc=9V9UOrwvIyQAX9RQd40&_nc_ht=scontent.fjpa2-1.fna&oh=00_AfBVZ8DFJ4ucQXV7PSomkm413sXywsqGJ5pL2t0KRPbnkQ&oe=64314A35'),
                  ),
                  accountName: const Text("Ricacio Santana de Albuquerque"),
                  accountEmail: const Text("ricaciozz@gmail.com")),
              ListTile(title: const Text("voltar"), trailing: IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeApp()));
              }, icon: const Icon(Icons.refresh_outlined))),
              ListTile(
                title: Text(widget.login!.text),
                subtitle: Text(widget.senha!.text),
              )
            ],
          ),
        ),
        appBar: AppBar(
            title: const Text(
          "Home Page",
          style: TextStyle(),
          textAlign: TextAlign.center,
        )),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                child: Text("Contardor $cont"),
                onTap: () {
                  setState(() {
                    cont++;
                  });
                }),
            Switch(
              value: Controle.controle.mudar,
              onChanged: (bool value) {
                Controle.controle.mudando();
              },
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Container(width: 100, height: 100, color: Colors.black), Container(width: 100, height: 100, color: Colors.black), Container(width: 100, height: 100, color: Colors.black)])
          ]),
        ));
  }
}

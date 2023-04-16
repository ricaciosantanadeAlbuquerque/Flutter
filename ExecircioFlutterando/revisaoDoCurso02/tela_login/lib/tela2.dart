import 'package:flutter/material.dart';
import 'package:tela_login/login.dart';

class Tela2 extends StatefulWidget {
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  Tela2({super.key,required this.login,required this.senha});
  @override
  State<Tela2> createState() {
    return EstadoTela2();
  }
}

class EstadoTela2 extends State<Tela2> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                      'https://scontent.fjpa15-1.fna.fbcdn.net/v/t1.6435-9/89843298_3553751868030388_5473714911404097536_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeHbsiFTTTHzBmR3aSjfXyO3LEEdZlL6b8ssQR1mUvpvyzCz_ksFWdsEG96Cx3O9Hhs2JLWYxVQar_0Ll1fpv2yJ&_nc_ohc=hUR6NqvFV1UAX_1uGD-&_nc_ht=scontent.fjpa15-1.fna&oh=00_AfBaoynmjF1ewxzQ95ohulkHcTvess4INfQHpCc3WyRFpA&oe=6463C612')),
              accountName: const Text('Ricacio Santana Albuquerque'),
              accountEmail: const Text('ricaciozz@gmail.com')),
          ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const HomeApp();
                    }));
                  },
                  icon: const Icon(Icons.refresh_outlined)),
              title: const Text("Voltar")),
              ListTile(
                title: Text(widget.login.text),
                subtitle: Text(widget.senha.text),
              )
        ])),
        appBar: AppBar(
            title: const Center(
              child: Text('Gerência de estado global'),
            ),
            actions: [escolha()]),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: GestureDetector(
                child: Text("Contatdor $contador"),
                onTap: () {
                  setState(() {
                    contador++;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            escolha(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
                Container(width: 100, height: 100, color: Colors.black)
              ],
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                contador++;
              });
            },
            child: const Icon(Icons.add)));
  }

  Widget escolha() {
    return Switch(value: true, onChanged: (vakue) {});
  }
}

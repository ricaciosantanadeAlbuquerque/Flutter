import 'package:flutter/material.dart';
import 'package:tela_widget3/controle.dart';
import 'package:tela_widget3/home_app.dart';

class Tela2 extends StatefulWidget {
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();

  Tela2({super.key, required this.nome, required this.senha});

  @override
  State<Tela2> createState() {
    return Tela2Estado();
  }
}

class Tela2Estado extends State<Tela2> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                        'https://scontent.fjpa15-1.fna.fbcdn.net/v/t39.30808-6/340259915_168374192778514_8666715644313197174_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFnQMM79n0XrxoJNFm32LlupC54m20QjGWkLnibbRCMZfJdKYt9ufIwFkCxScY1Eros9MkY9RkLr7QD9Yks5UWM&_nc_ohc=sjZqodBxvikAX_o6AAJ&_nc_ht=scontent.fjpa15-1.fna&oh=00_AfD3SKQvyHdL0NmAgBJWDuXrK0KMao13ysCKWIMb-39MAQ&oe=6435E879')),
                accountName: const Text('Ricacio Santana'),
                accountEmail: const Text('ricaciozz@gmail.com')),
            ListTile(
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return const HomeApp();
                      }));
                    },
                    icon: const Icon(Icons.refresh_outlined)),
                title: Text('Nome: ${widget.nome.text}'),
                subtitle: Text('senha: ${widget.senha.text}'))
          ],
        )),
        appBar: AppBar(title: const Text('Home page')),
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
                }),
            conponente(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Container(width: 50, height: 50, color: Colors.black), Container(width: 50, height: 50, color: Colors.black), Container(width: 50, height: 50, color: Colors.black)],
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                cont++;
              });
            },
            child: const Icon(Icons.add)));
  }

  Widget conponente() {
    return Switch(
        value: Controle.instancia.mudar,
        onChanged: (value) {
          Controle.instancia.mudando();
        });
  }
}

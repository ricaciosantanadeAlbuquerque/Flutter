import 'package:flutter/material.dart';
import 'package:tela_login_navegacao/controle.dart';
import 'package:tela_login_navegacao/login.dart';

class Tela2 extends StatefulWidget {
  final String nome;
  final String senha;
  const Tela2({super.key, required this.nome, required this.senha});
  @override
  Tela2State createState() => Tela2State();
}

class Tela2State extends State<Tela2> {
  int cont = 0;
  Widget escolha() {
    return Switch(
      value: Controle.instancia.valor,
      onChanged: (value) {
        Controle.instancia.mudar();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height:100,
                      child: Image.network(
                          'https://scontent.fjpa15-1.fna.fbcdn.net/v/t39.30808-6/340259915_168374192778514_8666715644313197174_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFnQMM79n0XrxoJNFm32LlupC54m20QjGWkLnibbRCMZfJdKYt9ufIwFkCxScY1Eros9MkY9RkLr7QD9Yks5UWM&_nc_ohc=WpbYk8xSCJEAX9ijCeq&_nc_ht=scontent.fjpa15-1.fna&oh=00_AfBGuJVF-GNZnHxaJSuJ-M8BCneFgAx2t_lKF7dSpYEjxw&oe=64655E79'),
                    )),
                accountEmail: const Text('ricaciozz@gmail.com'),
                accountName: const Text('Ricacio santana')),
            ListTile(
              trailing: IconButton(
                icon: const Icon(Icons.refresh_outlined),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeApp();
                  }));
                },
              ),
              title: const Text('Voltar'),
            ),
            ListTile(title: Text(widget.nome), subtitle: Text(widget.senha))
          ]),
        ),
        appBar: AppBar(
          title: const Center(
            child: Text("Home Page"),
          ),
          actions:[escolha()]
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                child: Text('contando $cont'),
                onTap: () {
                  setState(() {
                    cont++;
                  });
                }),
            const SizedBox(height: 10),
            escolha(),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(width: 50, height: 50, color: Colors.black)
            ]),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              cont++;
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}

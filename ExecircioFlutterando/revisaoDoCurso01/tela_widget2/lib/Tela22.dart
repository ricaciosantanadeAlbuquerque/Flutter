import 'package:flutter/material.dart';
import 'package:tela_widget2/controle.dart';
import 'package:tela_widget2/home_app.dart';

class Tela22 extends StatefulWidget {
  TextEditingController login;
  TextEditingController senha;

   Tela22({super.key,required this.login, required this.senha});

  @override
  State<Tela22> createState() {
    return EstadoTela22();
  }
}

class EstadoTela22 extends State<Tela22> {
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
                        'https://scontent.fjpa15-1.fna.fbcdn.net/v/t39.30808-6/340259915_168374192778514_8666715644313197174_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFnQMM79n0XrxoJNFm32LlupC54m20QjGWkLnibbRCMZfJdKYt9ufIwFkCxScY1Eros9MkY9RkLr7QD9Yks5UWM&_nc_ohc=sjZqodBxvikAX_jBD0x&_nc_ht=scontent.fjpa15-1.fna&oh=00_AfAAs5CX2MHtTDc8dEkoPvKRISGAA9gN--_O4Zq_-AYhRg&oe=6433EE39'),
                  ),
                  accountName: const Text('Ricacio'),
                  accountEmail: const Text('ricaciozz@gmail.com')),
              ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return const HomeApp();
                        }));
                      },
                      icon: const Icon(Icons.refresh_outlined)),
                  title: const Text('Voltar')),
                  ListTile(
                    title: Text(widget.login.text),
                    subtitle: Text(widget.senha.text),
                  )
            ],
          ),
        ),
        appBar: AppBar(title: const Center(child: Text("Home Page")), actions: [mundando()]),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  child: Text('Contador $cont'),
                  onTap: () {
                    setState(() {
                      cont++;
                    });
                  }),
              const SizedBox(
                height: 25,
              ),
              mundando(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Container(width: 100, height: 100, color: Colors.black), Container(width: 100, height: 100, color: Colors.black), Container(width: 100, height: 100, color: Colors.black)],
              )
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                cont++;
              });
            },
            child: const Icon(Icons.add)));
  }

// ================== Mudando ===============================
  Widget mundando() {
    return Switch(
        value: Controle.controle.verdade,
        onChanged: (value) {
          Controle.controle.mudar();
        });
  }
}

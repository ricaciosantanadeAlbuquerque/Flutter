import 'package:flutter/material.dart';

import 'home_app.dart';

class Cabeca extends StatelessWidget {
  const Cabeca({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
                child: Image.network(
                    'https://scontent.fjpa16-1.fna.fbcdn.net/v/t39.30808-6/340259915_168374192778514_8666715644313197174_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFnQMM79n0XrxoJNFm32LlupC54m20QjGWkLnibbRCMZfJdKYt9ufIwFkCxScY1Eros9MkY9RkLr7QD9Yks5UWM&_nc_ohc=2jMwjXsvAHwAX9-LCgz&_nc_ht=scontent.fjpa16-1.fna&oh=00_AfDUjtTTPoQsh243rw3IK458Dwo5VAid6PBDW3UT7ZbYJA&oe=647F13B9')),
            accountName: const Text('Ricacio Santana de albuquerque'),
            accountEmail: const Text("ricaciozz@gmail.com")),
        ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeApp();
                }));
              },
            ),
            title: const Text('Voltar'))
      ]),
    );
  }
}

import 'package:converso_moeda07/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../components/entrada_saida.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  HomeController? controle;

  @override
  void initState() {
    controle = HomeController(entrada: entrada, saida: saida);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 100),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/image/logo.jpg',
                width: 150,
                height: 150,
              ),
            ),
            EntradaSaida(
              controller: entrada,
              isSelected: controle!.toCurrency!,
              listCurrencyModel: controle!.listCurrencyModel!,
              onChanged: (value) {
                setState(() {
                  controle!.toCurrency = value;
                });
              },
            ),
            EntradaSaida(
                listCurrencyModel: controle!.listCurrencyModel!,
                isSelected: controle!.fromCurrency!,
                controller: saida,
                onChanged: (value) {
                  setState(() {
                    controle!.fromCurrency = value;
                  });
                }),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
              ),
              onPressed: () {
                controle!.convert();
              },
              child: const Text('CONVERTER!'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:converso_moeda55/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../components/entrada_saida.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  HomeControlle? homeControlle;

  @override
  void initState() {
    homeControlle = HomeControlle(entrada: entrada, saida: saida);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/image/logo.jpg',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              EntradaSaida(
                selectedItem: homeControlle!.toCurrency!,
                listCurrencyModel: homeControlle!.listCurrencyModel!,
                controller: entrada,
                onChanged: (model) {
                  setState(() {
                     homeControlle!.toCurrency = model;
                  });
                },
              ),
              EntradaSaida(
                selectedItem: homeControlle!.fromCurrency!,
                listCurrencyModel: homeControlle!.listCurrencyModel!,
                controller: saida,
                onChanged: (model) {
                  setState(() {
                    homeControlle!.fromCurrency = model;
                  });
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                ),
                onPressed: () {
                  homeControlle!.convert();
                },
                child: const Text('CONVERTE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

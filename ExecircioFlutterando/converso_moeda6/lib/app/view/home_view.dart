import 'package:converso_moeda6/app/components/entrada_saida.dart';
import 'package:converso_moeda6/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  HomeController? homeController;

  @override
  void initState() {
    homeController = HomeController(entrada: entrada, saida: saida);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 200, bottom: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/image/logo.jpg',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 30),
              EntradaSaida(
                controller: entrada,
                listCurrencyModel: homeController!.listCurrencyModel!,
                onChanged: (value) {
                  homeController!.toCurrency = value;
                },
                selectedItem: homeController!.toCurrency!,
              ),
              EntradaSaida(
                controller: saida,
                listCurrencyModel: homeController!.listCurrencyModel!,
                onChanged: (value) {
                  homeController!.fromCurrency = value;
                },
                selectedItem: homeController!.fromCurrency!,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                ),
                onPressed: () {
                  homeController!.convert();
                },
                child: const Text('CONVERTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

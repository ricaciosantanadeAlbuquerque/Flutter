import 'package:converso_moeda08/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import '../components/entrada_saida.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeviewState();
}

class HomeviewState extends State<HomeView> {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  HomeControlle? controle;
  @override
  void initState() {
    controle = HomeControlle(entrada: entrada, saida: saida);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 200, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/image/logo.jpg', width: 150, height: 150),
              ),
              const SizedBox(height: 30),
              EntradaSaida(
                  controlle: entrada,
                  listaCurrencyModel: controle!.listCurrencyModel!,
                  isSelected: controle!.toCurrency!,
                  onChanged: (value) {
                    setState(() {
                      controle!.toCurrency = value;
                    });
                  }),
              EntradaSaida(
                  controlle: saida,
                  listaCurrencyModel: controle!.listCurrencyModel!,
                  isSelected: controle!.fromCurrency!,
                  onChanged: (value) {
                    setState(() {
                      controle!.fromCurrency = value;
                    });
                  }),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
                onPressed: () {
                  controle!.convert();
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

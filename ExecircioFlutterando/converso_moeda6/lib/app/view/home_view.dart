import 'package:converso_moeda6/app/components/entrada_saida.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final entrada = TextEditingController();
  final saida = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left:30,right:30,top:200,bottom:20),
          child: Column(
            children:[
              ClipRRect(
                borderRadius:BorderRadius.circular(50),
                child: Image.asset('assets/image/logo.jpg',
                width:100,
                height: 100,
                ),
              ),
              const SizedBox(height:30),
            EntradaSaida(controller: entrada),
            EntradaSaida(controller: saida),
              const SizedBox(height: 50),
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.amberAccent,
                ),
                onPressed:(){},
                child:const Text('CONVERTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

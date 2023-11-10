import 'package:flutter/material.dart';

import '../components/entrada_saida.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right:20,top:0,bottom:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset('assets/image/logo.jpg',
                width:100,
                height:100,
                ),
              ),
              const SizedBox(height: 30,),
               EntradaSaida(),
               EntradaSaida(),
              const SizedBox(height:50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.amberAccent,
                ),
                onPressed: (){}, child: const Text('CONVERTE'),),
            ],
          ),
        ),
      ),
    );
  }
}

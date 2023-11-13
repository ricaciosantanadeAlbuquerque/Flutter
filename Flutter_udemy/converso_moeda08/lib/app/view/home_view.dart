import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeviewState();
}

class HomeviewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        children:[
          Image.asset(''),
          
          ElevatedButton(onPressed: (){}, child: const Text('CONVERTER')),
        ],
      ),
    );
  }
}

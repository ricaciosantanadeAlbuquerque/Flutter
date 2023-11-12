import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left:20,right:20,bottom:20,top: 100),
          child: Column(
            children:[
              ClipOval(
                child: Image.asset('assets/image/logo.jpg',
                width:150,
                height:150,
                ),
              ),
             
             const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.amberAccent,
                ),
                onPressed:(){
        
                },
                child:const Text('CONVERTER!'),
                ),
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';

void main(List<String> args){
runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: HomePage()
    );
  }
}


class HomePage extends StatefulWidget{ // gerencia o estado recebe o estado 
  @override
 State <StatefulWidget> createState(){
    return HomePageState();
  }
}


class HomePageState extends State<StatefulWidget>{
    int cont = 0;
    @override
    Widget build(BuildContext context){
      return Container(
        child:Center(
           child: GestureDetector( // capta os cliques do mause no texto
            child: Text("contador $cont"),
            onTap: (){
              setState((){ // gerencia de estado local
                cont++;
              });
            }
           )
        )
      );
    }
}
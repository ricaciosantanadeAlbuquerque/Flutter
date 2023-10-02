import 'package:flutter/material.dart';

void main() => runApp(const MyApp(title:'Flexibal && Expanded'));

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomeApp(title: title,),
    );
  }
}

class MyHomeApp extends StatelessWidget {
  final String title;

  const MyHomeApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(title)
      ),
      body: Row(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
         crossAxisAlignment:CrossAxisAlignment.start,
        children:<Widget>[
           Container(
            height:60,
            color:Colors.red,
            child:const Text('Item - pretty bgl!')
           ),
           Flexible(
            flex:2,
            fit: FlexFit.tight,
             child: Container(
              height:60,
              color:Colors.blue,
              child: const Text('Item')
             ),
           ),
           Flexible(
            flex:4,
            fit: FlexFit.tight,
             child: Container(
              height:60,
              color: Colors.yellow,
              child:const Text('Item 3')
             ),
           )
        ]
      )
    );
  }
}

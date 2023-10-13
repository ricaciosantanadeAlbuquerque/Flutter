import 'package:flutter/material.dart';

void main() => runApp(const MyApp(title: 'Flexible & Expanded'));

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeApp(title: title));
  }
}

class HomeApp extends StatelessWidget {
  final String title;

  const HomeApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex:1,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.red,
              child: const Text('Item 1 - pretty big!'),
            ),
          ),
          Flexible(
            flex:3,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Text('Item2'),
            ),
          ),
          Flexible(
            flex:2,
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: const Text('Item3'),
            ),
          ),
        ],
      ),
    );
  }
}

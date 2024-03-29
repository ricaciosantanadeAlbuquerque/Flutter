import 'package:converso_moeda6/app/view/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AppWidget());

class AppWidget extends StatelessWidget {

  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  const HomeView(),
    );
  }

}

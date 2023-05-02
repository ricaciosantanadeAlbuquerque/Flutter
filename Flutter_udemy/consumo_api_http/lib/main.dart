import 'package:flutter/material.dart';

import 'view/view.dart';

void main() => runApp(const MeuAppLista());

class MeuAppLista extends StatelessWidget {
  const MeuAppLista({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.blue
      ),
      home:  const HomeAppLista()
    );
  }
}

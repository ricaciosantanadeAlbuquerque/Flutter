import 'package:flutter/material.dart';

import 'list_contacts.dart';


main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListContacts(),
    );
  }
}


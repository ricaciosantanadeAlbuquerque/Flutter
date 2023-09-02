import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageEstado();
  }
}

class HomePageEstado extends State<StatefulWidget> {
   String login = "";
  String senha = "";
  Widget corpo() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(width: 150, height: 150, child: ClipOval(child: Image.asset("assets/11.jpg")
        )
        ),
        Container(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
            child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (text) {
                    login = text;
                  },
                  decoration: const InputDecoration(labelText: "Login", 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Senha", 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  )
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(login == "1" && senha == "2"){
                        Navigator.of(context).pushNamed("tela2");
                      }
                    });
                  },
                  child: Container(
                    
                    color: Colors.red, 
                    width: double.infinity, 
                    child: const Center(child: Text("Entrar")
                    )
                    )
                    ),
            )
          ]),
        ))
      ]),
    );
  }
//=========================build========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "assets/cidade.jpg",
          fit: BoxFit.cover,
        ),
      ),
      corpo()
    ]));
  }
}


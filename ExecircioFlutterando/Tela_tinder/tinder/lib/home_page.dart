import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:const Color.fromARGB(255, 245, 106, 96),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
             Container(
              width: 100,
              height:100,
              child:Image.asset("assets/tinder.png",color: Colors.white)
             ),
             Container(
              height:20
             ),
             Container(
              child:const Text(
                "Location Changer",
                style:TextStyle(
                  color: Colors.white,
                  fontSize:20
                )
                )
             ),
             // ignore: prefer_const_constructors
             SizedBox(
              height:12
             ),
             Container(
              child:const Text("Plugin App for Tinder",
              style:TextStyle(
                color: Colors.white,
                fontSize:15
              )
              )
             ),
             Container(
              height:30
             ),
             Container(
              width:240,
               child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                
                  child: ListTile(
                    title: const Center(child: Text("Login with Facebook",style:TextStyle(
                      color:Colors.red,
                      fontSize:20
                    ))),
                    onTap:(){
                      setState((){
                      
                      });
                    }
                  )
               
               ),
             )
          ],
        )
       )
    );
  }
}

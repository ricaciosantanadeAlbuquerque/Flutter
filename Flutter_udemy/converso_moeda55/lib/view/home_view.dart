import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right:20,top:100,bottom:20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/image/logo.jpg',
                width:150,
                height:150,
                ),
                const SizedBox(height: 30,),
                Row(children: [
                  Expanded(
                    flex:1,
                    child: SizedBox(
                      height:63,
                      child: DropdownButton(
                        iconDisabledColor: Colors.amberAccent,
                        isExpanded: true,
                        underline:Container(height:1,color:Colors.amberAccent),
                        items : const [
                          DropdownMenuItem(child:  Text('Real'),),
                        ],
                        onChanged:(value){},
                       
                      ),
                    ),
                  ),
                  const SizedBox(width:20),
                const  Expanded(
                  flex:2,
                   child: TextField(
                      decoration: InputDecoration(
                        enabledBorder:UnderlineInputBorder(
                          borderSide:BorderSide(
                            color:Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                 ),
                ],
                ), 
                const SizedBox(height:50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.amberAccent,
                  ),
                  onPressed: (){}, child: const Text('CONVERTE'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

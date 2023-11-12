import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final controller = TextEditingController();

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
              Row(
                children:[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height:63,
                      child: DropdownButton(
                        iconEnabledColor:Colors.amberAccent,
                        isExpanded:true,
                        underline: Container(color:Colors.amberAccent,height:1),
                        items: const [ 
                          DropdownMenuItem(child: Text(''),
                        ),
                        ],
                        onChanged:(value){}
                      ),
                    ),
                  ),
                  const SizedBox(width:20),
                  Expanded(
                    flex:3,
                    child: TextField(
                      controller:controller,
                      decoration: const InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                               color:Colors.amberAccent
                          ),
                         ),
                      ),
                    ),
                  ),
                ],
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

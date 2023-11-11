import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right:20,top:200,bottom:20),
          child: Column(
            children:[
              ClipRRect(
                borderRadius:BorderRadius.circular(50),
                child: Image.asset('assets/image/logo.jpg',
                width:100,
                height: 100,
                ),
              ),
              const SizedBox(height:30),
              Row(children:[
                Expanded(
                  flex:1,
                  child: SizedBox(
                    height:63,
                    child: DropdownButton(
                      isExpanded:true,
                      iconDisabledColor:Colors.amberAccent,
                      underline: Container(height: 1, color:Colors.amberAccent),
                      items:[],
                      onChanged:(value){}
                    ),
                  ),
                ),
              const SizedBox(width:20),
                Expanded(    // O TextField() dentro de uma Row() produz um erro, é necessário dar um tamaho fixo ou expandi-ló
                flex:4,
                  child: TextField(
                    controller: controller,
                    decoration:const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:BorderSide(
                          color: Colors.amberAccent,
                        ),
                      ),
                      focusedBorder:UnderlineInputBorder(
                        borderSide:BorderSide(
                          color:Colors.amberAccent
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

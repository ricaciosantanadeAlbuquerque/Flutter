import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/inico.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeTela2();
  }
}

class HomeTela2 extends State<StatefulWidget> {
  bool? num1 = false, num2 = false, num3 = false, num4 = false;

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/imagem/tinder.png",
                  color: const Color.fromARGB(255, 228, 5, 46),
                )),
            Container(
              child: const ListTile(
                title: Center(
                  child: Text("Bem-Vindo(a) ao Tinder.",
                  style:TextStyle(
                    fontFamily:"Nunito-ExtraBold",
                    color:Colors.black
                  )
            )
            ), subtitle: Center(
              child: Text("Siga as regras da casa")
              )
              )
              ),
            Container(
                child: CheckboxListTile(
                  activeColor:Colors.red,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Seja você mesmo.",
                    style:TextStyle(
                      fontFamily:"Nunito-ExtraBold"
                    )
                    ),
                    value: num4,
                    onChanged: (valeu) {
                      setState(() {
                        num4 = !num4!;
                      });
                    })),
            Container(
                child: const ListTile(
              subtitle: Center(child: Text("Certifique-se de que suas fotos, idade e descrição sejam verdadeiras.")),
            )),
            Container(
                child: CheckboxListTile(
                  activeColor:Colors.red,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Proteja-se.",
                    style:TextStyle(
                      fontFamily:"Nunito-ExtraBold"
                    )),
                    value: num3,
                    onChanged: (value) {
                      setState(() {
                        num3 = !num3!;
                      });
                    })),
            Container(
                child: const ListTile(
              subtitle: Text("Não forneça informações pessoais rápido de mais. Encontros com segurança"),
            )),
            Container(
                child: CheckboxListTile(
                    activeColor:Colors.red,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Seja legal.",
                    style:TextStyle(
                      fontFamily:"Nunito-ExtraBold"
                    )),
                    value: num2,
                    onChanged: (valeu) {
                      setState(() {
                        num2 = !num2!;
                      });
                    })),
            Container(
                child: const ListTile(
              subtitle: Text("Respeite os outros e os trate como você gostaria de ser tratado."),
            )),
            Container(
                child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: CheckboxListTile(
                     
                      activeColor: Colors.red,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Seja pró-ativo",
                        style:TextStyle(fontFamily:"Nunito-ExtraBold")
                        ),
                        subtitle: const Text("Sempre denuncie mau comportamento."),
                        value: num1,
                        onChanged: (value) {
                          setState(() {
                            num1 = value;
                          });
                        })),
              ],
            )),
            Container(
              padding: const EdgeInsets.all(10),
              width: 405,
              height: 80,
              color: Color.fromARGB(255, 246, 0, 0),
              child: Container(
                  padding: const EdgeInsets.all(3),
                  width: 405,
                  height: 65,
                  color: Colors.white,
                  child: Card(
                      color: const Color.fromARGB(255, 228, 5, 46),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (num1 == true && num2 == true && num3 == true && num4 == true) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Inicio()));
                              } else {
                                showDialog(context: context, 
                                builder: (context){
                                  return const AlertDialog(
                                    title: Text("Erro! você precisa confirma todos os dados "),
                                  );});
                              }
                            });
                          },
                          child: Text("eu aceito".toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.white)
                          )
                          )
                          )
                          ),
            )
          ]),
        ),
      ),
    ));
  }
}

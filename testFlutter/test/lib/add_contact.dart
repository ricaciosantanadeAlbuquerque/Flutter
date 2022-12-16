import 'package:flutter/material.dart';
import 'contact.dart';




class AddContact extends StatelessWidget {
  TextEditingController edtNome = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddContact"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: edtNome,
              decoration: InputDecoration(
                hintText: "Nome"
              ),
            ),
            TextField(
              controller: edtEmail,
              decoration: InputDecoration(
                  hintText: "Email"
              ),
            ),
            TextField(
              controller: edtPhone,
              decoration: InputDecoration(
                  hintText: "Phone"
              ),
            ),
            ElevatedButton(
                onPressed: (){
                   Contact(edtNome.text, edtEmail.text, edtPhone.text);
                  Navigator.pop(context);
                },
                child: Text("Cadastrar")
            )
          ],
        ),
      ),
    );
  }
  
  Contact(String text, String text2, String text3) {}
}

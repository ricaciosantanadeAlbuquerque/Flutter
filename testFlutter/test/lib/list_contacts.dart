import 'package:flutter/material.dart';

import 'add_contact.dart';
import 'contact.dart';




class ListContacts extends StatefulWidget {
  const ListContacts({Key? key}) : super(key: key);

  @override
  State<ListContacts> createState() => _ListContactsState();
}

class _ListContactsState extends State<ListContacts> {

  List<Contact> list_contacts = [
    Contact("A", "a@email,com", "(83) 88888-8888"),
    Contact("B", "b@email,com", "(83) 88888-8888"),
    Contact("C", "c@email,com", "(83) 88888-8888"),
    Contact("D", "d@email,com", "(83) 88888-8888")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Contacts"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list_contacts.length,
          itemBuilder: (context, i){
            return buildItem(i);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute<Contact>(builder: (context){
            return AddContact();
          })).then((contact) {
            if(contact != null){
              setState(() {
                list_contacts.add(contact);
              });
            }else{
              print("Não prometa o que não pode cumprir!");
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildItem(int i) {
    return Container(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${list_contacts[i].name}"),
                  Text("Email: ${list_contacts[i].email}"),
                  Text("Phone: ${list_contacts[i].phone}")
                ],
              ),
            ),
          );
  }
}

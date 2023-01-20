import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class TelaDados extends StatefulWidget {
  final String nome;
  final String email;
  final String senha;
  final String confirmaSenha;

  const TelaDados({super.key, required this.nome, required this.email, required this.senha, required this.confirmaSenha});

  @override
  State<TelaDados> createState() => EstadoDados();
}

class EstadoDados extends State<TelaDados> {
  String novoNome = "";
  String novoEmail = "";
  String novaSenha = "";
  String novaConfirmaSenha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                  child: Image.network(
                      "https://scontent.fjpa2-1.fna.fbcdn.net/v/t39.30808-6/283046171_7411184308953772_4456141829270858553_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEU8QjkHQ--WRi0c3ybVDbv3pHasxCjwVLekdqzEKPBUjNprE-bdiv8si3S2csr82Iu7xRzVHYMvEWy3dvqH2DN&_nc_ohc=UeUi6VL2nYIAX-FeuVI&_nc_ht=scontent.fjpa2-1.fna&oh=00_AfD0u_4fP3CuEpEblRvfY42UjazTLFvmV00SkeD04Y8MUw&oe=63CFB9FE")),
              accountName: const Text("ricacio"),
              accountEmail: const Text("ricaciozz@gmail.com")),
          ListTile(
            title: Text("${novoNome}"),
            trailing: IconButton(
                onPressed: () async {
                  final String valoNome = await FlutterClipboard.paste();
                  setState(() {
                    novoNome = valoNome;
                  });
                },
                icon: const Icon(Icons.paste)),
          ),
          ListTile(
              title:Text("${novoEmail}"),
              trailing: IconButton(
                  onPressed: () async {
                    final valorEmail = await FlutterClipboard.paste();
                    setState(() {
                      novoEmail = valorEmail;
                    });
                  },
                  icon: const Icon(Icons.paste))),
                  ListTile(
                    title:Text("${novaSenha}"),
                   trailing: IconButton(onPressed: ()async{

                        final valorSenha = await FlutterClipboard.paste();
                        setState(() {
                          this.novaSenha = valorSenha;
                        });
                   },icon: const Icon(Icons.paste),),
                  )
        ],
      )),
      appBar: AppBar(title: const Center(child: Text("Dados"))),
      body: Container(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Row(
            children: [
              Expanded(child: Text("Nome: ${widget.nome} ")),
              IconButton(
                onPressed: () async {
                  FlutterClipboard.copy(widget.nome);
                },
                icon: const Icon(Icons.copy),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Text("Email: ${widget.email}"),
              ),
              IconButton(
                  onPressed: () async {
                    await FlutterClipboard.copy(widget.email);
                  },
                  icon: const Icon(Icons.copy))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Text("Senha:${widget.senha} ")),
              IconButton(onPressed:()async{
                  await FlutterClipboard.copy(widget.senha);
              },icon:const Icon(Icons.copy),)
            ],
          ),
          const SizedBox(height: 15),
          Row(children: [
            Expanded(child: Text("Confirma Senha: ${widget.confirmaSenha}")),
            IconButton(onPressed: (){
              
            },icon: const Icon(Icons.copy),)
          ],)
        ]),
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeForme extends StatefulWidget {
  const HomeForme({super.key});
  @override
  State<HomeForme> createState() {
    return HomeEstado();
  }
}

class HomeEstado extends State<HomeForme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Formulário")), body:
    Padding(
      padding:const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Formulario(hint: "nome",label: "nome",icon: const Icon(Icons.person),),
            const SizedBox(height:10),
              Formulario(hint: "Email",label: "Email",icon: const Icon(Icons.email),),
              const SizedBox(height: 10),
               Formulario(hint: "Senha",label: "Senha",icon: const Icon(Icons.vpn_key),),
               const SizedBox(height: 10),
               Formulario(hint: "ConfirmaSenha",label: "ConfirmaSenha",icon: const Icon(Icons.vpn_key),),
               const SizedBox(height:27),
               Container(
                width:double.infinity,
                height:40,
                child:ElevatedButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(Icons.save),
                   label:const Text("Salvar")
                   )
               ),
               const SizedBox(height:15),
               Container(
                width:double.infinity,
                height:40,
                child:ElevatedButton.icon(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ) ,
                  onPressed:(){},
                   icon: const Icon(Icons.restart_alt)
                   , label: const Text("resetar")
                   )
               )
          ],
        ),
      ),
    ));
  }
}

class Formulario extends StatelessWidget {
   
  TextEditingController controle = TextEditingController();
   Widget? icon;
   String? hint;
   String? label;

  Formulario({super.key, this.icon, this.hint, this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      decoration: InputDecoration(
        hintText:hint,
        labelText:label,
        border: const OutlineInputBorder(),
        prefixIcon: icon ?? const Icon(Icons.person)
      )
    );
  }
}

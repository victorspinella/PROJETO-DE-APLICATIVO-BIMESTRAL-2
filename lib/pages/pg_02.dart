import 'package:flutter/material.dart';
import 'package:bimestral_2/core/app_export.dart';

class Cadastro extends StatelessWidget {

  final TextEditingController nomeController  = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  AuthService _autentificacaoservico = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[

                    Text(
                      'Inscreva-se',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 207, 137, 137),
                      ),
                    ),
                    

                   SizedBox(height: 20.0),
                   TextField(
                   controller: nomeController, 
                   style: CustomTextStyles.bodyMediumLight,
                   decoration: InputDecoration(
                   labelText: "nome",
                   filled: true,
                   fillColor: appTheme.gray3007f,
                   contentPadding: EdgeInsets.all(12.0),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8.0),
                     ),
                    ),
                  ),

                   SizedBox(height: 20.0),
                   TextField(
                   controller: emailController,
                   style: CustomTextStyles.bodyMediumLight,
                   decoration: InputDecoration(
                   labelText: "email",
                   filled: true,
                   fillColor: appTheme.gray3007f,
                   contentPadding: EdgeInsets.all(12.0),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8.0),
                     ),
                    ),
                  ),
                   SizedBox(height: 20.0),
                   TextField(
                   controller: senhaController,
                   style: CustomTextStyles.bodyMediumLight,
                   decoration: InputDecoration(
                   labelText: "senha",
                   filled: true,
                   fillColor: appTheme.gray3007f,
                   contentPadding: EdgeInsets.all(12.0),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8.0),
                     ),
                    ),
                  ),


                 SizedBox(height: 20.0),
                 buildElevatedButton('Cadastrar', context),



                 SizedBox(height: 31.v),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     TextButton(
                       onPressed: () {
                       onTapFazerVoltar(context);
                         },
                       style: TextButton.styleFrom(
                       padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
                       backgroundColor: Colors.transparent,
                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                       ),
                          child: Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text(
                            "voltar",
                          style: CustomTextStyles.bodyMediumLight14,
                           ),
                           ),
                          ),
                     ],
                   ) ,             
                  



                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

 Widget buildElevatedButton(String text, BuildContext context) {
  return ElevatedButton(

    onPressed: ()  async{
   

      String nome =  nomeController.text;
      String email = emailController.text;
      String senha = senhaController.text;

      print('Nome: $nome');
      print('Email: $email');
      print('Senha: $senha'); 

     if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
        // Exibir uma mensagem de erro (pode ser uma SnackBar, AlertDialog, etc.)
        mostrarSnackBar(context: context, texto: "Campos nao preenchidos ");
      } else {

            //  mostrarSnackBar(context: context, texto: " preenchidos ");
              _autentificacaoservico.cadastrousuario(nome: nome, email: email, senha: senha);
       
      }
   
    },
    child: Text(text),
  );
}

///navegacao da teça  'cadastro' quando a ação é acionada
    onTapFazerVoltar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.autenticaoDeUsuarioScreen);
  }

}

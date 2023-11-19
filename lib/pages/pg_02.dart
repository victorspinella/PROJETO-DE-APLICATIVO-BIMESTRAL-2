import 'package:flutter/material.dart';
import '../service/service_file.dart';
import '../router/app_router.dart';

class Cadastro extends StatelessWidget {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  AuthService _autentificacaoservico = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              Image.asset(
                'assets/imagens/fundo01.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Inscreva-se agora e comece a meditar e explore o Medic',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    buildTextField('Nome', 'E-mail', 'Senha'),
                    SizedBox(height: 20.0),
                    buildElevatedButton('Cadastrar', context),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText, String labelTextPassword) {
    return Column(
      children: [
        TextField(
          controller: nomeController,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: 'nome',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: senhaController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: labelTextPassword,
            hintText: 'Senha',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: 'E-mail',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButton(String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
     // Obter os valores dos campos de texto

      String nome =  nomeController.text;
      String email = emailController.text;
      String senha = senhaController.text;

      print('Nome: $nome');
      print('Email: $email');
      print('Senha: $senha');

       // Verificar se os campos estão preenchidos
      if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
        // Exibir uma mensagem de erro (pode ser uma SnackBar, AlertDialog, etc.)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Por favor, preencha todos os campos.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
       
      } else {


        _autentificacaoservico.cadastrousuario(nome: nome, email: email, senha: senha);
        

        //Navegar para a próxima tela
       Navigator.pushReplacementNamed(context, RouteGenerator.initialRoute);
      }
    },



      //  Navigator.pushReplacementNamed(context, RouteGenerator.initialRoute);
      
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF729899),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

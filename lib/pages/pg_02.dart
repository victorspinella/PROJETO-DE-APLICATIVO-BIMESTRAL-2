import 'package:flutter/material.dart';
import 'package:bimestral_2/core/app_export.dart';
import 'package:provider/provider.dart';
import 'package:bimestral_2/controllers/gps_controller.dart';

class Cadastro extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
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
                    SizedBox(height: 31.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExibirLocalizacao(),
                          ),
                        );
                      },
                      child: Text('Mostrar Localização'),
                    ),
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
      onPressed: () async {
        String nome = nomeController.text;
        String email = emailController.text;
        String senha = senhaController.text;

        print('Nome: $nome');
        print('Email: $email');
        print('Senha: $senha');

        if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
          mostrarSnackBar(context: context, texto: "Campos nao preenchidos");
        } else {
          _autentificacaoservico.cadastrousuario(
              nome: nome, email: email, senha: senha);
        }
      },
      child: Text(text),
    );
  }
}

class ExibirLocalizacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LocationController>(
        create: (context) => LocationController(),
        child: Builder(builder: (context) {
          final local = context.watch<LocationController>();

          String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
              : local.erro;

          return Center(child: Text(mensagem));
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../gerenciamento_de_estado/sua_classe_provider.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/fundo01.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: buildLoginForm(context),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Bem-vindo ao Medic Free Meditation',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () async {
            // Utilize o Provider para acessar a classe Provider
             SuaClasseProvider provider = Provider.of<SuaClasseProvider>(context, listen: false);

            // Lógica de autenticação usando o Provider
            await provider.autenticar('email', 'senha');

            // Navegar para a próxima tela após a autenticação
            Navigator.pushReplacementNamed(context, '/pg_principal');
          },      
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Lógica de autenticação
              // Por exemplo, verificar as credenciais e fazer login
               Navigator.pushReplacementNamed(context,'/pg_principal' );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF729899),
            ),
            child: Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10.0),

             TextButton(
             onPressed: () {
              // Navegação para a tela de cadastro
                Navigator.pushReplacementNamed(context, '/cadastro');
                  },
              child: Text(
                 "Não tem uma conta? Cadastre-se",
                  style: TextStyle(
                   color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
              ),
           ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../pages/pg_01.dart';



class RouteGenerator {
  static const String initialRoute = '/'; // Rota inicial, geralmente a tela de login

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Configuração das rotas aqui
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      




      default:
        // Rota desconhecida, você pode redirecionar para uma tela de erro
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota desconhecida: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
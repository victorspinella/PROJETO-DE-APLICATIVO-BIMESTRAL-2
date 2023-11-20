import 'package:flutter/material.dart';
import 'package:bimestral_2/pages/export_pg.dart';

class AppRoutes {

  static const String autenticaoDeUsuarioScreen = '/pg_01';
  static const String cadastro = '/pg_02';
   static const String compra = '/pg_03';

  static Map<String, WidgetBuilder> routes = {

    autenticaoDeUsuarioScreen: (context) => LoginPage(),
    cadastro: (context) => Cadastro(),
    compra: (context) => Compra(),
  };
}

import 'package:bimestral_2/pages/pg_04.dart';
import 'package:flutter/material.dart';
import 'package:bimestral_2/pages/export_pg.dart';

class AppRoutes {

   static const String autenticaoDeUsuarioScreen = '/pg_01';
   static const String cadastro = '/pg_02';
   static const String compra = '/pg_03';
   static const String gerapremio = '/pg_04';

  static Map<String, WidgetBuilder> routes = {

    autenticaoDeUsuarioScreen: (context) => LoginPage(),
    cadastro: (context) => Cadastro(),
    compra: (context) => Compra(),
     gerapremio:(context)=> CriaPremio(),
  };
}

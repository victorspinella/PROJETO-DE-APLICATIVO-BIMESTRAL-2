import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importe o provider
import './router/app_router.dart';
import './gerenciamento_de_estado/sua_classe_provider.dart'; // Importe o seu provider
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
 



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Erro ao inicializar o Firebase: $e');
  }

  runApp(
   
    ChangeNotifierProvider(
      create: (context) => SuaClasseProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bimestral_2',

      initialRoute: AppRoutes.autenticaoDeUsuarioScreen ,
      routes: AppRoutes.routes,


    );
  }
  
}



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';







class Premio {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<List<Map<String, dynamic>>> buscarPremiosAtivos() async {
    DatabaseReference premiosRef = database.reference().child('premios');
    DataSnapshot snapshot = (await premiosRef.once()).snapshot;

    List<Map<String, dynamic>> premiosAtivos = [];

    if (snapshot.value != null && snapshot.value is Map<dynamic, dynamic>) {
      Map<dynamic, dynamic> premios = snapshot.value as Map<dynamic, dynamic>;

      premios.forEach((key, value) {
        String status = value['status'];

        if (status == 'ativo') {
          premiosAtivos.add({
            'nome': value['nome'] ?? 'Sem nome',
            'imagem': value['imagem'] ?? 'Sem imagem',
            'valor': value['valor'] ?? 0.0,
            'status': 'ativo',
          });
        }
      });
    }

    return premiosAtivos;
  }
}
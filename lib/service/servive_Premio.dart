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
           String premioid = key;
          premiosAtivos.add({
             
            'premioid': premioid,
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

class PremioData {

  final String premioid ;
  final String nome;
  final double valor;
  final String imagem;
 
  PremioData({required this.premioid,required this.nome,required this.valor,required this.imagem});
}
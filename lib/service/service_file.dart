import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';



class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final DatabaseReference databaseReference;
 // AuthService() : databaseReference = FirebaseDatabase.instance.ref();
  final FirebaseApp app = Firebase.app();

  



Future<void>gerarCotas({

    required String nomePremio,
    required String imagem,
    required double valor_premio,
     required double valor_cota,
    required int quantidadeCotas ,

    
    })  async {


  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);
  final DatabaseReference databaseReference = database.ref();

  String premioId = DateTime.now().millisecondsSinceEpoch.toString();
   // Informações do prêmio
  Map<String, dynamic> premioData = {
    'nome': nomePremio,
    'imagem': imagem,
    'valor': valor_premio,
    'status': 'ativo', // Pode ser 'ativo' ou 'encerrado'
  };

       // Adiciona o prêmio ao banco de dados
       await   databaseReference.child('premios/$premioId').set(premioData);
 
  for (int i = 0; i < quantidadeCotas; i++) {
    String cotaId = i.toString().padLeft(5, '0'); // Formata o ID da cota para ter cinco dígitos

    // Informações da cota
    Map<String, dynamic> cotaData = {
      'valor_cota': valor_cota,
      'numero': i + 1,
      'status': 'disponivel', // Pode ser 'disponivel', 'vendido', etc.
      'idUsuario': null, // Será preenchido quando a cota for vendida
      'idPremio': premioId,
    };

    // Adiciona a cota ao banco de dados
    await databaseReference.child('cotas/$cotaId').set(cotaData);
  }
}



///////////////////////////////////////////////////////////////////


Future<void> comprarCotasAleatorias({
  required int quantidadeCotas,
}) async {
  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);
  final DatabaseReference databaseReference = database.ref();

  // Verifica se o usuário está autenticado
  User? user = _auth.currentUser;
  if (user == null) {
    // Usuário não autenticado, trate conforme necessário
    print('Usuário não autenticado');
    return;
  }

  // Consulta todas as cotas disponíveis no banco de dados
  DataSnapshot cotasSnapshot = await databaseReference.child('cotas').orderByChild('status').equalTo('disponivel').get();

 if (cotasSnapshot.value is Map<dynamic, dynamic>) {

    Map<dynamic, dynamic>? cotasDisponiveis = cotasSnapshot.value as Map<dynamic, dynamic>?;

    // Transforma o mapa em uma lista de pares chave-valor
   if (cotasDisponiveis != null) {
    List<MapEntry<dynamic, dynamic>> cotasList = cotasDisponiveis.entries.toList();
  

    // Embaralha a lista de pares chave-valor
    cotasList.shuffle();

    // Seleciona a quantidade desejada de cotas aleatórias
    List<String> cotasParaComprar = cotasList.take(quantidadeCotas).map((entry) => entry.key.toString()).toList();
   
    // Atualiza o status das cotas para vendido e associa ao usuário
    for (String cotaId in cotasParaComprar) {
      await databaseReference.child('cotas/$cotaId').update({
        'status': 'vendido',
        'idUsuario': user.uid,
      });
    } }else{  print('nao a cotas disponiveis '); }
  } else {
    print('Erro ao recuperar as cotas disponíveis');
  }

  // Você pode adicionar lógica adicional aqui, como registrar a compra, enviar notificações, etc.
}






 // for (int i = 0; i < totalCotas; i++) {
 //   String cotaId = i.toString().padLeft(5, '0'); // Formata o ID da cota para ter cinco dígitos

 //   databaseReference.child('cotas/$cotaId').remove();
 

 cadastrousuario({
 
 required String nome,
 required String email,
 required String senha,


 }) {
 _auth.createUserWithEmailAndPassword(
  email: email,
  password: senha);
 }

 Future<String?> login({
  
   required String email,
   required String senha,
      }) async {
    try {

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:email,
      password:senha,
    );
      // Navegar para a tela principal após a autenticação bem-sucedida
     
      return null;

    } on FirebaseAuthException catch (e) {
      // Tratar erros de autenticação, por exemplo, exibindo uma mensagem de erro
      print("Erro de autenticação: $e");
      return e.message;
    }

}}





class FirestoreService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String name, String email) async {
    try {
      await usersCollection.add({
        'name': name,
        'email': email,
      });
    } catch (e) {
      print("Erro ao adicionar usuário: $e");
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await usersCollection.doc(userId).delete();
    } catch (e) {
      print("Erro ao excluir usuário: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Erro ao obter usuários: $e");
      return [];
    }
  }

  Future<Map<String, dynamic>?> getUserById(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await usersCollection.doc(userId).get();
      return documentSnapshot.data() as Map<String, dynamic>?; 
    } catch (e) {
      print("Erro ao obter usuário: $e");
      return null;
    }
 }}

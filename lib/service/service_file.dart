import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  }
  
}


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
  }
}


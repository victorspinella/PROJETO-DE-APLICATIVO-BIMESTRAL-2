import 'package:firebase_auth/firebase_auth.dart';

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

}
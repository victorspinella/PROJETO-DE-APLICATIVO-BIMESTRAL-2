import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final DatabaseReference databaseReference;
 // AuthService() : databaseReference = FirebaseDatabase.instance.ref();

final FirebaseApp app = Firebase.app();
  
Future<void> gerarCotas({
    required String nomePremio,
    required String imagem,
    required double valor_premio,
    required double valor_cota,
    required int quantidadeCotas,
  }) async {
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
    await databaseReference.child('premios/$premioId').set(premioData);

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

      // Adiciona a cota ao banco de dados sob o prêmio correspondente
      await databaseReference.child('premios/$premioId/cotas/$cotaId').set(cotaData);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////
Future<String> upload(String path) async {
  File file = File(path);

  try {
    final FirebaseStorage storage = FirebaseStorage.instanceFor(app: app);
    final Reference storageReference = storage.ref();

    // Generate a unique file name for the upload
    String fileName = 'images/img-${DateTime.now().millisecondsSinceEpoch}.png';
    Reference fileReference = storageReference.child(fileName);
    print ('eu tento 3');

    // Upload the file to Firebase Storage
    print(file);
    await fileReference.putFile(file);

    // Get the URL of the uploaded file
    String downloadURL = await fileReference.getDownloadURL();

    // Return the URL
    return downloadURL;
    
  } on FirebaseException catch (e) {
    // Handle any errors during the upload
    print('Error during upload: ${e.code}');
    throw Exception('Error during upload: ${e.code}');
  }
}


//////////////////////////////////////////////////////////////////////////////////////
Future<XFile?> getImagem()async{
final ImagePicker _picker=ImagePicker();
XFile? image = await _picker.pickImage(source:ImageSource.camera);
return image ;
}
///////////////////////////////////////////////////////////////////////////////////////


pickeruploadimagem() async {
  XFile? file = await getImagem();
  if(file != null ){
    User? user = _auth.currentUser;
    if (user == null) {
      // Usuário não autenticado, trate conforme necessário
      print('Usuário não autenticado');
      return;
    }

    String imageUrl = await upload(file.path);
    if (imageUrl.isNotEmpty) {
      // Aqui você tem a URL da imagem e pode usá-la conforme necessário.
      print('URL da imagem: $imageUrl');
      return imageUrl ;
    } else {
      print('Falha no upload da imagem');
    }
  } else { 
    print('falha pickeruploadimagem');
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
}

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








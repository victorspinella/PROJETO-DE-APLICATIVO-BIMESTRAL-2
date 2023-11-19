import 'package:flutter/foundation.dart';

class SuaClasseProvider with ChangeNotifier {
  // Adicione aqui o estado que você deseja compartilhar

  // Exemplo de um método para autenticação
  Future<void> autenticar(String email, String senha) async {
    // Sua lógica de autenticação aqui

    // Em seguida, notifique os ouvintes (widgets interessados) sobre a mudança
    notifyListeners();
  }
}
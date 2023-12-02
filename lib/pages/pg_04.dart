
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bimestral_2/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';


class CriaPremio extends StatefulWidget {
  CriaPremio({Key? key}) : super(key: key);

  @override
  _CriaPremioState createState() => _CriaPremioState();
}

class _CriaPremioState extends State<CriaPremio> {
  
  final AuthService _gerarCotas = AuthService();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController valorcotaController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  final FirebaseApp app = Firebase.app();
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotas App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Prêmio'),
            ),
          
            TextField(
               controller: imagemController,
              decoration: InputDecoration(labelText: 'URL da Imagem do Prêmio'),
            ),
              ElevatedButton(
  onPressed: () async {
     String imageUrl = await _gerarCotas.pickeruploadimagem();
    if (imageUrl.isNotEmpty) {
      imagemController.text = imageUrl;
    }
  },
             
  child: Text('Selecionar Imagem'),
),
            TextField(
              controller: valorController,
              decoration: InputDecoration(labelText: 'Valor do Prêmio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: valorcotaController,
              decoration: InputDecoration(labelText: 'Valor da cota '),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: quantidadeController,
              decoration: InputDecoration(labelText: 'Quantidade de Cotas'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                  
                   _gerarCotas.gerarCotas(

                  nomePremio: nomeController.text,
                  imagem: imagemController.text,
                  valor_premio: double.parse(valorController.text),
                  valor_cota:  double.parse(valorcotaController.text),
                  quantidadeCotas: int.parse(quantidadeController.text),
                );
              },
              child: Text('Gerar Cotas'),
            ),
          ],
        ),
      ),
    );
  }
}

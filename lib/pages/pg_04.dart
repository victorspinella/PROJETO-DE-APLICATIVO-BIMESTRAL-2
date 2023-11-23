import 'package:flutter/material.dart';
import 'package:bimestral_2/core/app_export.dart';

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

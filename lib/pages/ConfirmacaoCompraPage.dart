import 'package:flutter/material.dart';

class ConfirmacaoCompraPage extends StatefulWidget {
  @override
  _ConfirmacaoCompraPageState createState() => _ConfirmacaoCompraPageState();
}

class _ConfirmacaoCompraPageState extends State<ConfirmacaoCompraPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _exibirPopup();
    });
  }

  void _exibirPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Compra Confirmada!'),
          content: Text('Sua compra foi confirmada com sucesso!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação de Compra'),
      ),
      body: Center(
        // Se precisar de algum conteúdo na página, adicione aqui
      ),
    );
  }
}

import 'package:bimestral_2/core/app_export.dart';
import 'package:bimestral_2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class TelaPremio extends StatelessWidget {
  final Premio _premio = Premio();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Prêmios e Vencedores'),
    ),
    body: Column(
      children: <Widget>[
        buildPremiosList(context),
        buildVencedoresSection(context), // Adicione 'context' aqui
      ],
    ),
  );
}

  Widget buildPremiosList(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _premio.buscarPremiosAtivos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar os prêmios'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Nenhum prêmio ativo encontrado.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> premio = snapshot.data![index];
                return buildPremioCard(context, premio);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildPremioCard(BuildContext context, Map<String, dynamic> premio) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 150, // Defina a largura desejada
          height: 120, // Defina a altura desejada
          child: Image.network(
            premio['imagem'] ?? '',
            fit: BoxFit.cover, // Ajusta a imagem para cobrir o container
          ),
        ),
        title: Text(premio['nome'] ?? 'Sem nome'),
        subtitle: Text('Valor: \$${premio['valor']}'),
        onTap: () {
          onTapFazerLogin(context);
        },
      ),
    );
  }

  Widget buildVencedoresSection(BuildContext context) {
  return Expanded(
    child: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vencedores'),
            ElevatedButton(
              onPressed: () =>  onTapGerarPremio(context),
              child: Text('Criar Premio'),
            ),
          ],
        ),
      ),
      color: Color.fromARGB(255, 202, 195, 165),
    ),
  );
}

  onTapFazerLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.compra);
  }

  onTapGerarPremio(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.gerapremio);
    
  }
}

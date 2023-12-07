import 'package:bimestral_2/core/app_export.dart';
import 'package:bimestral_2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:bimestral_2/pages/ConfirmacaoCompraPage.dart';


class Compra extends StatefulWidget {
  Compra({Key? key}) : super(key: key);
  final AuthService premio = AuthService();

  @override
  _CompraState createState() => _CompraState();
}

class _CompraState extends State<Compra> {
  int _counter = 0;
  PremioData? premioData;
  List<String> _cotasEncontradas = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 55.h, vertical: 100.v),
          child: Column(
            children: [
              SizedBox(
                height: 150.v,
                width: 250.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: premioData?.imagem ?? '',
                      height: 136.v,
                      width: 204.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150.v,
                        width: 250.h,
                        decoration: BoxDecoration(
                          color: appTheme.blueGray100.withOpacity(0.3),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (premioData != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      premioData!.nome,
                      style: theme.textTheme.labelLarge,
                    ),
                    Text(
                      "R ${premioData!.valor.toStringAsFixed(2)}",
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              Column(
                children: <Widget>[
                  Text(
                    'Contador:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: _incrementCounter,
                        child: Icon(Icons.add),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _decrementCounter,
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
              // Exibe a lista de cotas encontradas
              SizedBox(height: 20.0),
              Expanded(
                child: _cotasEncontradas.isEmpty
                    ? Text('Nenhuma cota encontrada')
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Cotas: ${_cotasEncontradas.join(', ')}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
              ),
              CustomElevatedButton(
                text: "Buscar cotas Disponíveis",
                margin: EdgeInsets.only(left: 10.h, right: 8.h),
                onPressed: () async {
                  try {
                    // String premioid= '1701734576541' ;
                    print('tento ');
                    String? premioid = premioData!.premioid;
                    print(premioid);

                    List<String> cotasEncontradas =
                        await widget.premio.buscarCotasDisponiveis(
                      premioId: premioid,
                      quantidadeCotas: _counter,
                    );
                    // Atualiza o estado com as cotas encontradas
                    setState(() {
                      _cotasEncontradas = cotasEncontradas;
                    });
                  } catch (e) {
                    print("Erro ao buscar cotas disponíveis: $e");
                    // Adicione qualquer tratamento de erro necessário aqui
                  }
                },
              ),
              CustomElevatedButton(
                text: "Confirmar Compra",
                margin: EdgeInsets.only(left: 10.h, right: 8.h),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmacaoCompraPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Obtém os dados do prêmio ao iniciar a tela
    if (premioData == null) {
      premioData = ModalRoute.of(context)?.settings.arguments as PremioData?;
      if (premioData != null) {
        // Atualiza a interface do usuário se houver dados do prêmio disponíveis
        setState(() {});
      }
    }
  }
}

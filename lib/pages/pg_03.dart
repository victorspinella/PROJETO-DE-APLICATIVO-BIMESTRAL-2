import 'package:bimestral_2/core/app_export.dart';
import 'package:bimestral_2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Compra extends StatefulWidget {
  const Compra({Key? key}) : super(key: key);
 @override
  _CompraState createState() => _CompraState();
}
class _CompraState extends State<Compra> {
  int _counter = 0;

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
                padding:
                    EdgeInsets.symmetric(horizontal: 55.h, vertical: 100.v),
                child: Column(children: [
                  SizedBox(
                      height: 150.v,
                      width: 250.h,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgYamahaFazerFz2520236,
                            height: 136.v,
                            width: 204.h,
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 150.v,
                                width: 250.h,
                                decoration: BoxDecoration(
                                    color:
                                        appTheme.blueGray100.withOpacity(0.3))))
                      ])),
                  SizedBox(height: 5.v),
                  Text("Yamaha Fazer FZ25 2023 R 21.490,00",
                      style: theme.textTheme.labelLarge),
                  SizedBox(height: 5.v),
                  Text("Valor da rifa R 60,00",
                      style: theme.textTheme.bodyMedium),

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                SizedBox(width: 20), // Espaço entre os botões
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
         ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                  SizedBox(height: 79.v),
                  CustomElevatedButton(
                      text: "Confirmar Compra",
                      margin: EdgeInsets.only(left: 28.h, right: 26.h),
                      onPressed: () {
                        

                      })
                ]))));
  }


  /// Navigates to the telaDeConfirmacaoScreen when the action is triggered.
  
}

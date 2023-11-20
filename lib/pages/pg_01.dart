import 'package:bimestral_2/core/app_export.dart';
import 'package:bimestral_2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 77.v),
                      Text("Faça seu login para continuar",
                          style: theme.textTheme.titleLarge),


                      SizedBox(height: 20.0),
TextField(
  style: CustomTextStyles.bodyMediumLight,
  decoration: InputDecoration(
    labelText: "Informe seu e-mail",
    filled: true,
    fillColor: appTheme.gray3007f,
    contentPadding: EdgeInsets.all(12.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
),



                      SizedBox(height: 20.0),
TextField(
  obscureText: true, // Para ocultar a senha
  style: CustomTextStyles.bodyMediumLight,
  decoration: InputDecoration(
    labelText: "Informe sua senha de acesso",
    filled: true,
    fillColor: appTheme.gray3007f,
    contentPadding: EdgeInsets.all(12.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
),
SizedBox(height: 45.0),




                      
                      CustomElevatedButton(
                          width: 157.h,
                          text: "Fazer login",
                          onPressed: () {

                            onTapFazerLogin(context);

                          }),

                    SizedBox(height: 31.v),
SizedBox(height: 31.v),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    TextButton(
      onPressed: () {
       onTapFazerCadastro(context);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        backgroundColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Text(
          "Cadastre-se",
          style: CustomTextStyles.bodyMediumLight14,
        ),
      ),
    ),
    TextButton(
      onPressed: () {
        // Adicione aqui a lógica para o botão "Esqueceu sua senha?"
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        backgroundColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        "Esqueceu sua senha?",
        style: CustomTextStyles.bodyMediumLight14,
      ),
    ),
  ],
),

                    ]))));
  }

  /// Navigates to the telaInicialScreen when the action is triggered.
    onTapFazerLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.compra);
  }
  onTapFazerCadastro(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cadastro);

}
}
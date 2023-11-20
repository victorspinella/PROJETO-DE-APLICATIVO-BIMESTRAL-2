import 'package:bimestral_2/core/app_export.dart';
import 'package:bimestral_2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Compra extends StatelessWidget {
  const Compra({Key? key}) : super(key: key);

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
                  SizedBox(height: 87.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                                height: 40.v,
                                width: 115.h,
                                text: "04",
                                margin: EdgeInsets.only(bottom: 4.v),
                                buttonStyle: CustomButtonStyles.fillGrayF,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumBlack900),
                            SizedBox(
                                height: 44.v,
                                width: 40.h,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              height: 40.adaptSize,
                                              width: 40.adaptSize,
                                              decoration: BoxDecoration(
                                                  color:
                                                      appTheme.blueGray100))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text("+",
                                              style:
                                                  theme.textTheme.displaySmall))
                                    ])),
                            Container(
                                height: 44.v,
                                width: 40.h,
                                margin: EdgeInsets.only(left: 1.h),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              height: 40.adaptSize,
                                              width: 40.adaptSize,
                                              decoration: BoxDecoration(
                                                  color:
                                                      appTheme.blueGray100))),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.h),
                                              child: Text("-",
                                                  style: theme
                                                      .textTheme.displaySmall)))
                                    ]))
                          ])),
                  Spacer(),
                  SizedBox(height: 79.v),
                  CustomElevatedButton(
                      text: "Confirmar Compra",
                      margin: EdgeInsets.only(left: 28.h, right: 26.h),
                      onPressed: () {
                        onTapConfirmarCompra(context);
                      })
                ]))));
  }

  /// Navigates to the telaDeConfirmacaoScreen when the action is triggered.
  onTapConfirmarCompra(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.compra);
  }
}

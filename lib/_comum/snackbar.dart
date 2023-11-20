import 'package:flutter/material.dart';


  mostrarSnackBar({
    required BuildContext context,
    required String texto,
    bool isErro = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        backgroundColor: isErro ? Colors.red : Colors.green,
      ),
    );
  }


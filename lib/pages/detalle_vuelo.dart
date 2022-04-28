import 'package:flutter/material.dart';

class DetalleVuelo extends StatelessWidget {
  const DetalleVuelo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalles de vuelo")),
      body: SingleChildScrollView(child: Text("hola")),
    );
  }
}

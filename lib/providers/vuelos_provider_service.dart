import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visor_de_datos_de_vuelos/models/vuelos.dart';

class VuelosProviderService extends ChangeNotifier {
  final String _baseUrl =
      "https://prueba-tecnica-d5940-default-rtdb.firebaseio.com";
  final List<Vuelos> listaVuelos = [];
  final List<Vuelos> listaVuelossearch = [];
  late Vuelos selectProspecto;
  bool isLoading = true;

  VuelosProviderService() {
    loadProspectos();
  }

  Future loadProspectos() async {
    var url = Uri.parse(_baseUrl + "/.json");
    print(url);
    var response = await http.get(url);
    final Map<String, dynamic> data = jsonDecode(response.body);
    data["vuelos"].forEach((key, value) {
      listaVuelos.add(Vuelos.fromMap(value));
    });

    listaVuelos;
    notifyListeners();
  }
}

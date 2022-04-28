import 'dart:convert';
import 'clima.dart';
import 'datavuelo.dart';

class Vuelos {
  Vuelos({
    required this.climaDestino,
    required this.climaOrigen,
    required this.datavuelo,
  });

  Clima climaDestino;
  Clima climaOrigen;
  Datavuelo datavuelo;

  factory Vuelos.fromJson(String str) => Vuelos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vuelos.fromMap(Map<String, dynamic> json) => Vuelos(
        climaDestino: Clima.fromMap(json["clima_destino"]),
        climaOrigen: Clima.fromMap(json["clima_origen"]),
        datavuelo: Datavuelo.fromMap(json["datavuelo"]),
      );

  Map<String, dynamic> toMap() => {
        "clima_destino": climaDestino.toMap(),
        "clima_origen": climaOrigen.toMap(),
        "datavuelo": datavuelo.toMap(),
      };
}

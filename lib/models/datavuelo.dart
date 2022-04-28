import 'dart:convert';

class Datavuelo {
  Datavuelo({
    required this.airline,
    required this.destination,
    required this.destinationIataCode,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.destinationName,
    required this.flightNum,
    required this.origin,
    required this.originIataCode,
    required this.originLatitude,
    required this.originLongitude,
    required this.originName,
  });

  String airline;
  String destination;
  String destinationIataCode;
  String destinationLatitude;
  String destinationLongitude;
  String destinationName;
  String flightNum;
  String origin;
  String originIataCode;
  String originLatitude;
  String originLongitude;
  String originName;

  factory Datavuelo.fromJson(String str) => Datavuelo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datavuelo.fromMap(Map<String, dynamic> json) => Datavuelo(
        airline: json["airline"],
        destination: json["destination"],
        destinationIataCode: json["destination_iata_code"],
        destinationLatitude: json["destination_latitude"],
        destinationLongitude: json["destination_longitude"],
        destinationName: json["destination_name"],
        flightNum: json["flight_num"],
        origin: json["origin"],
        originIataCode: json["origin_iata_code"],
        originLatitude: json["origin_latitude"],
        originLongitude: json["origin_longitude"],
        originName: json["origin_name"],
      );

  Map<String, dynamic> toMap() => {
        "airline": airline,
        "destination": destination,
        "destination_iata_code": destinationIataCode,
        "destination_latitude": destinationLatitude,
        "destination_longitude": destinationLongitude,
        "destination_name": destinationName,
        "flight_num": flightNum,
        "origin": origin,
        "origin_iata_code": originIataCode,
        "origin_latitude": originLatitude,
        "origin_longitude": originLongitude,
        "origin_name": originName,
      };
}

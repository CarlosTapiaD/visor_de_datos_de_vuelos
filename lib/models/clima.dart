import 'current.dart';
import 'location.dart';
import 'request.dart';
import 'dart:convert';

class Clima {
  Clima({
    required this.current,
    required this.location,
    required this.request,
  });

  Current current;
  Location location;
  Request request;

  factory Clima.fromJson(String str) => Clima.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clima.fromMap(Map<String, dynamic> json) => Clima(
        current: Current.fromMap(json["current"]),
        location: Location.fromMap(json["location"]),
        request: Request.fromMap(json["request"]),
      );

  Map<String, dynamic> toMap() => {
        "current": current.toMap(),
        "location": location.toMap(),
        "request": request.toMap(),
      };
}

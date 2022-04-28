import 'dart:convert';

class Request {
  Request({
    required this.language,
    required this.query,
    required this.type,
    required this.unit,
  });

  String language;
  String query;
  String type;
  String unit;

  factory Request.fromJson(String str) => Request.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Request.fromMap(Map<String, dynamic> json) => Request(
        language: json["language"],
        query: json["query"],
        type: json["type"],
        unit: json["unit"],
      );

  Map<String, dynamic> toMap() => {
        "language": language,
        "query": query,
        "type": type,
        "unit": unit,
      };
}

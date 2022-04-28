import 'dart:convert';

class Location {
  Location({
    required this.country,
    required this.lat,
    required this.localtime,
    required this.localtimeEpoch,
    required this.lon,
    required this.name,
    required this.region,
    required this.timezoneId,
    required this.utcOffset,
  });

  String country;
  String lat;
  String localtime;
  int localtimeEpoch;
  String lon;
  String name;
  String region;
  String timezoneId;
  String utcOffset;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        country: json["country"],
        lat: json["lat"],
        localtime: json["localtime"],
        localtimeEpoch: json["localtime_epoch"],
        lon: json["lon"],
        name: json["name"],
        region: json["region"],
        timezoneId: json["timezone_id"],
        utcOffset: json["utc_offset"],
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "lat": lat,
        "localtime": localtime,
        "localtime_epoch": localtimeEpoch,
        "lon": lon,
        "name": name,
        "region": region,
        "timezone_id": timezoneId,
        "utc_offset": utcOffset,
      };
}

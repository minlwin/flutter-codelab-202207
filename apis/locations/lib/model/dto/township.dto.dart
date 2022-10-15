// To parse this JSON data, do
//
//     final township = townshipFromJson(jsonString);

import 'dart:convert';

List<Township> townshipFromJson(String str) =>
    List<Township>.from(json.decode(str).map((x) => Township.fromJson(x)));

String townshipToJson(List<Township> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Township {
  Township({
    required this.id,
    required this.name,
    required this.stateId,
    required this.stateName,
  });

  int id;
  String name;
  int stateId;
  String stateName;

  factory Township.fromJson(Map<String, dynamic> json) => Township(
        id: json["id"],
        name: json["name"],
        stateId: json["stateId"],
        stateName: json["stateName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateId": stateId,
        "stateName": stateName,
      };
}

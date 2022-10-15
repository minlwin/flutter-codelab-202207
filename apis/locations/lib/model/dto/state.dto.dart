// To parse this JSON data, do
//
//     final stateDto = stateDtoFromJson(jsonString);

import 'dart:convert';

List<StateDto> stateDtoFromJson(String str) =>
    List<StateDto>.from(json.decode(str).map((x) => StateDto.fromJson(x)));

String stateDtoToJson(List<StateDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateDto {
  StateDto({
    required this.id,
    required this.name,
    required this.region,
    required this.capital,
  });

  int id;
  String name;
  String region;
  String capital;

  factory StateDto.fromJson(Map<String, dynamic> json) => StateDto(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        capital: json["capital"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "capital": capital,
      };
}

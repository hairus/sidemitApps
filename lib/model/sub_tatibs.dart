// To parse this JSON data, do
//
//     final subTatibs = subTatibsFromJson(jsonString);

import 'dart:convert';

List<SubTatibs> subTatibsFromJson(String str) =>
    List<SubTatibs>.from(json.decode(str).map((x) => SubTatibs.fromJson(x)));

String subTatibsToJson(List<SubTatibs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubTatibs {
  int id;
  int tatibId;
  String subTatib;
  String poin;
  DateTime createdAt;
  DateTime updatedAt;

  SubTatibs({
    required this.id,
    required this.tatibId,
    required this.subTatib,
    required this.poin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubTatibs.fromJson(Map<String, dynamic> json) => SubTatibs(
        id: json["id"],
        tatibId: json["tatib_id"],
        subTatib: json["sub_tatib"],
        poin: json["poin"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tatib_id": tatibId,
        "sub_tatib": subTatib,
        "poin": poin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

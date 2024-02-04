// To parse this JSON data, do
//
//     final pointSiswa = pointSiswaFromJson(jsonString);

import 'dart:convert';

List<PointSiswa> pointSiswaFromJson(String str) =>
    List<PointSiswa>.from(json.decode(str).map((x) => PointSiswa.fromJson(x)));

String pointSiswaToJson(List<PointSiswa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PointSiswa {
  int id;
  int nis;
  int kelasId;
  int point;
  int guruId;
  int tasId;
  String ket;
  DateTime createdAt;
  DateTime updatedAt;
  int subTatibId;
  DateTime tgl;
  Users users;

  PointSiswa({
    required this.id,
    required this.nis,
    required this.kelasId,
    required this.point,
    required this.guruId,
    required this.tasId,
    required this.ket,
    required this.createdAt,
    required this.updatedAt,
    required this.subTatibId,
    required this.tgl,
    required this.users,
  });

  factory PointSiswa.fromJson(Map<String, dynamic> json) => PointSiswa(
        id: json["id"],
        nis: json["nis"],
        kelasId: json["kelas_id"],
        point: json["point"],
        guruId: json["guru_id"],
        tasId: json["tas_id"],
        ket: json["ket"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subTatibId: json["sub_tatib_id"],
        tgl: DateTime.parse(json["tgl"]),
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nis": nis,
        "kelas_id": kelasId,
        "point": point,
        "guru_id": guruId,
        "tas_id": tasId,
        "ket": ket,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub_tatib_id": subTatibId,
        "tgl":
            "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
        "users": users.toJson(),
      };
}

class Users {
  int id;
  String username;
  String name;
  String email;
  int role;
  int subRole;
  int tatib;
  String ket;
  int nis;
  String status;
  dynamic nip;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Users({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.role,
    required this.subRole,
    required this.tatib,
    required this.ket,
    required this.nis,
    required this.status,
    required this.nip,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        subRole: json["subRole"],
        tatib: json["tatib"],
        ket: json["ket"],
        nis: json["nis"],
        status: json["status"],
        nip: json["nip"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "role": role,
        "subRole": subRole,
        "tatib": tatib,
        "ket": ket,
        "nis": nis,
        "status": status,
        "nip": nip,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/kelas_siswa.dart';
import 'package:hyper_ui/model/sub_tatibs.dart';
import 'package:http/http.dart' as http;

class TatibController extends State<TatibView> {
  static late TatibController instance;
  late TatibView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<List<KelasSiswa>> doGetKelasSiswa() async {
    var response = await http.get(
      Uri.parse('https://sidemit.sumenepsmansa.sch.id/api/kumer/kelasSiswa'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AuthServices.token}"
      },
    );
    List obj = json.decode(response.body);

    return obj.map((e) => KelasSiswa.fromJson(e)).toList();
  }

  Future<List<SubTatibs>> getTatibs() async {
    var response = await http.get(
      Uri.parse('https://sidemit.sumenepsmansa.sch.id/api/kumer/subTatibs'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AuthServices.token}"
      },
    );
    List obj = json.decode(response.body);

    return obj.map((e) => SubTatibs.fromJson(e)).toList();
  }

  Future simpTatib(String tatibId, String nis, [String? tanggal]) async {
    var response = await http.post(
      Uri.parse("https://sidemit.sumenepsmansa.sch.id/api/kumer/simpanTatib"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AuthServices.token}"
      },
      body: jsonEncode({
        "nis": nis,
        "tatib_id": tatibId,
        "tanggal": tanggal,
      }),
    );
    if (response.statusCode == 500) {
      snackbarDanger(message: "terjadi kesalahan");
    }
    if (response.statusCode == 201) {
      snackbarIconSuccess(message: "Penginputan sukses");
      Get.offAll(PointdayView());
    }
  }
}

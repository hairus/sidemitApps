import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/kelas_siswa.dart';
import 'package:hyper_ui/model/sub_tatibs.dart';
import 'package:hyper_ui/service/auth_services/auth_services.dart';
import '../view/tatib_view.dart';
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
    print(obj);

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
    print(obj);

    return obj.map((e) => SubTatibs.fromJson(e)).toList();
  }
}

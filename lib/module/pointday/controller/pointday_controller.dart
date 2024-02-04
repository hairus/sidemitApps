import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/point_siswa.dart';
import '../view/pointday_view.dart';
import 'package:http/http.dart' as http;

class PointdayController extends State<PointdayView> {
  static late PointdayController instance;
  late PointdayView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future getPointTodays() async {
    var response = await http.get(
      Uri.parse("https://sidemit.sumenepsmansa.sch.id/api/getpointToday"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AuthServices.token}"
      },
    );
    List obj = json.decode(response.body);
    return obj.map((e) => PointSiswa.fromJson(e)).toList();
  }
}

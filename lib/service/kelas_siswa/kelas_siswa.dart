import 'dart:convert';

import 'package:hyper_ui/model/kelas_siswa.dart';
import 'package:http/http.dart' as http;
import 'package:hyper_ui/service/auth_services/auth_services.dart';

class KelasSiswaServices {
  Future<List<KelasSiswa>> getKelas() async {
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
}

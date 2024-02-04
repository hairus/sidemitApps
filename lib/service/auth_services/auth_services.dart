import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServices {
  static String? token;
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("https://sidemit.sumenepsmansa.sch.id/api/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      Map obj = jsonDecode(response.body);
      token = obj['token'];
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future logout() async {
    await http.post(
      Uri.parse("https://sidemit.sumenepsmansa.sch.id/api/admin/bthq/logout"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AuthServices.token}"
      },
    );
    AuthServices.token = "";
  }
}

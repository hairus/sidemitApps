import 'package:hyper_ui/core.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static String? token;
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "https://sidemit.sumenepsmansa.sch.id/api/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      var obj = response.data['token'];
      token = obj;
      print(obj);
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
  }
}

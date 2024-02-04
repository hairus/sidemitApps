import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/auth_services/auth_services.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  doLogin() async {
    // bool isValid = formKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }

    showLoading();
    await AuthServices().login(
      email: email!,
      password: password!,
    );
    hideLoading();

    Get.offAll(MainNavigationView());
  }
}

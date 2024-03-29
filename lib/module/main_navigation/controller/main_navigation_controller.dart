import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/auth_services/auth_services.dart';
import '../view/main_navigation_view.dart';

class MainNavigationController extends State<MainNavigationView> {
  static late MainNavigationController instance;
  late MainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  doLogout() async {
    showLoading();
    await AuthServices().logout();
    hideLoading();

    Get.offAll(LoginView());
  }
}

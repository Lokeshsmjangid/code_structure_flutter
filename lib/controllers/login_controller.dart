
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  bool obscureText = true;
  TextEditingController emailCtrl = TextEditingController(text: 'jack_boston@mail.com');
  TextEditingController passwordCtrl = TextEditingController(text: '12345678');

onPassSuffixTap(){
  obscureText = !obscureText;
  update();
}

  @override
  void onInit() {
    super.onInit();

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }
}

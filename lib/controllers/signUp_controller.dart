
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool obscureText = true;
  TextEditingController fNameCtrl = TextEditingController(text: 'Jack');
  TextEditingController lNameCtrl = TextEditingController(text: 'Boston');
  TextEditingController companyCtrl = TextEditingController(text: 'XYZ');
  TextEditingController businessCtrl = TextEditingController(text: 'Evolve Partner');
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

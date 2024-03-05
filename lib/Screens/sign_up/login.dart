import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/login_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    var deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(builder: (loginCtrl) {
          return Container(
            height: deviceHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addHeight(90.h),
                Image.asset(AppAssets.splashLogo, height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.20),
                addHeight(60.h),

                addRegularTxt('Sign In to Continue',fontSize: 24,color: AppColors.primaryColor),
                addHeight(36.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: 'Email ID',
                      controller: loginCtrl.emailCtrl,
                      suffixIcon: SvgPicture.asset(AppAssets.mailIcon).marginAll(14),
                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('Email ID',height: 1.0,fontSize: 11,fontWeight: FontWeight.w500,color: AppColors.txtFieldLabelColor,)),
                  ],
                ),
                addHeight(15.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: 'Password',
                      controller: loginCtrl.passwordCtrl,
                      obscureText: loginCtrl.obscureText,
                      suffixIcon: SvgPicture.asset(AppAssets.eyeOff).marginAll(14),
                      onTapSuffixIcon: loginCtrl.onPassSuffixTap,

                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('Password',height: 1.0,fontSize: 11,fontWeight: FontWeight.w500,color: AppColors.txtFieldLabelColor,)),
                  ],
                ),
                addHeight(15.h),
                CustomButton(
                  height: 52.h,
                    width: deviceWidth,
                    text: 'Sign In',
                    fontWeight: FontWeight.w400,
                    onPressed: (){}),
                addHeight(20.h),
                addRegularTxt('Forgot Password?',fontSize: 16,color: AppColors.primaryColor),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addBoldTxt('Don\'t have any account? ',fontSize: 13,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                    GestureDetector(
                        onTap: (){
                          Get.offAllNamed(AppRoutes.signUpScreen);
                        },
                        child: addBoldTxt('Sign Up',fontSize: 14,color: AppColors.primaryColor,)),
                  ],
                ),
                addHeight(20.h),
              ],
            ),
          );
        }).marginSymmetric(horizontal: 20.sp),
      ),
      // bottomSheet: Container(
      //   width: deviceWidth,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       addBoldTxt('Don\'t have any account? ',fontSize: 13,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
      //       GestureDetector(
      //           onTap: (){
      //             Get.toNamed(AppRoutes.signUpScreen);
      //           },
      //           child: addBoldTxt('Sign Up',fontSize: 14,color: AppColors.primaryColor,)),
      //     ],
      //   ).marginSymmetric(vertical: 6),
      // ),
    );
  }
}

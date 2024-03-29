
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/login_controller.dart';
import 'package:evolve/controllers/signUp_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controller = Get.find<SignUpController>();

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
          // physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addHeight(90.h),
                Image.asset(AppAssets.splashLogo, height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.20),
                addHeight(60.h),
                addRegularTxt('Create an Account', fontSize: 24,
                    color: AppColors.primaryColor),
                addHeight(36.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: 'First Name',
                      controller: controller.fNameCtrl,
                      suffixIcon: SvgPicture.asset(AppAssets.userIcon).marginAll(
                          14),
                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('First Name',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                  ],
                ),
                addHeight(15.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: 'Last Name',
                      controller: controller.lNameCtrl,
                      suffixIcon: SvgPicture.asset(AppAssets.userIcon).marginAll(
                          14),
                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('Last Name',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                  ],
                ),
                addHeight(15.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: 'Email ID',
                      controller: controller.emailCtrl,
                      suffixIcon: SvgPicture.asset(AppAssets.mailIcon).marginAll(
                          14),
                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('Email ID',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                  ],
                ),
                addHeight(15.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: 'Company',
                      controller: controller.companyCtrl,
                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('Company',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                  ],
                ),
                addHeight(15.h),
                Stack(
                  children: [
                    CustomTextField(
                      // labelText: '',
                      controller: controller.businessCtrl,
                      // suffixIcon: SvgPicture.asset(AppAssets.mailIcon).marginAll(14),
                    ),
                    Positioned(
                        left: 12.sp,
                        top: 6.sp,
                        child: addBoldTxt('Business Title',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                  ],
                ),
                addHeight(15.h),
                GetBuilder<SignUpController>(builder: (logic) {
                  return Stack(
                    children: [
                      CustomTextField(
                        // labelText: 'Password',
                        controller: logic.passwordCtrl,
                        obscureText: logic.obscureText,
                        suffixIcon: SvgPicture.asset(AppAssets.eyeOff).marginAll(
                            14),
                        onTapSuffixIcon: logic.onPassSuffixTap,

                      ),
                      Positioned(
                          left: 12.sp,
                          top: 6.sp,
                          child: addBoldTxt('Password',height: 1.0,fontSize: 11,fontWeight: FontWeight.w500,color: AppColors.txtFieldLabelColor,)),

                    ],
                  );
                }),
                addHeight(15.h),
                CustomButton(
                    height: 52.h,
                    width: deviceWidth,
                    text: 'Sign Up',
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.bottomNav);
                      // Get.toNamed(AppRoutes.payrollFlowChartScreen);
                    }),
                addHeight(30.h),
                // Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addBoldTxt('Already have a account? ', fontSize: 13,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                    GestureDetector(
                      onTap: (){
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                      child: addBoldTxt(
                        'Sign In', fontSize: 14, color: AppColors.primaryColor,),
                    ),
                  ],
                ),
                addHeight(20.h),
              ],

            ).marginSymmetric(horizontal: 20.sp)));
    // bottomSheet: Container(
    //   width: deviceWidth,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       addBoldTxt('Already have a account? ',fontSize: 13,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
    //       GestureDetector(
    //           onTap: (){
    //             Get.toNamed(AppRoutes.loginScreen);
    //           },
    //           child: addBoldTxt('Sign In',fontSize: 14,color: AppColors.primaryColor,)),
    //     ],
    //   ).marginSymmetric(vertical: 6),
    // ),
  }
}

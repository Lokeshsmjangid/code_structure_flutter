import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HelpDeskScreen extends StatefulWidget {
  const HelpDeskScreen({super.key});

  @override
  State<HelpDeskScreen> createState() => _HelpDeskScreenState();
}

class _HelpDeskScreenState extends State<HelpDeskScreen> {
  bool _visible = true;
  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBarOne(
        title: 'Helpdesk',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },

        // isAction: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addHeight(20),
            Center(child: addBoldTxt('Hello, how can we help?',fontSize: 18,color: AppColors.primaryColor)),
            addHeight(20),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: (){

                },
                child: Container(

                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: AppColors.greyColor
                      )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SizedBox(

                          height: 30.h,
                          width: 30.h,
                          child: SvgPicture.asset(AppAssets.helpdeskIcon1)),
                      addHeight(10),
                      addRegularTxt(
                          'Getting Started',fontSize: 14, color: AppColors.primaryColor,textAlign: TextAlign.center)
                    ],
                  ).marginSymmetric(vertical: 22, horizontal: 14),
                ),
              ),
            ),
            addWidth(10),
            Flexible(
              child: GestureDetector(
                onTap: (){

                },
                child: Container(

                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.black.withOpacity(0.2),
                      //       spreadRadius: 0.5.sp,
                      //       blurRadius: 4.sp)
                      // ],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: AppColors.helpDeskColor2
                      )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SizedBox(
                          height: 30.h,
                          width: 30.h,
                          child: SvgPicture.asset(AppAssets.helpdeskIcon2)),
                      addHeight(10),
                      addRegularTxt(
                          'Resources',fontSize: 14, color: AppColors.primaryColor,textAlign: TextAlign.center)
                    ],
                  ).marginSymmetric(vertical: 22, horizontal: 14),
                ),
              ),
            ),
            addWidth(10),
            Flexible(
              child: GestureDetector(
                onTap: (){

                },
                child: Container(

                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.black.withOpacity(0.2),
                      //       spreadRadius: 0.5.sp,
                      //       blurRadius: 4.sp)
                      // ],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: AppColors.greyColor
                      )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SizedBox(

                          height: 30.h,
                          width: 30.h,
                          child: SvgPicture.asset(AppAssets.helpdeskIcon3)),
                      addHeight(10),
                      addRegularTxt(
                          'Trust & Safety',fontSize: 14, color: AppColors.primaryColor,textAlign: TextAlign.center)
                    ],
                  ).marginSymmetric(vertical: 22, horizontal: 14),
                ),
              ),
            ),
          ],
        ),
            addHeight(40),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      addBoldTxt('How to secure my data in App?',fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),
                      Spacer(),
                      GestureDetector(
                          onTap: _toggle,
                          child: Icon(_visible?Icons.remove:Icons.add,color: AppColors.greyColor,).marginAll(4))
                    ],
                  ),
                  Visibility(
                    visible:_visible,
                    child: addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    color: AppColors.helpDeskColor),
                  ),
                ],
              ),
            ),
            addHeight(12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      addBoldTxt('Download offline documentation?',fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),
                      Spacer(),
                      GestureDetector(
                          onTap: _toggle,
                          child: Icon(_visible?Icons.remove:Icons.add,color: AppColors.greyColor,).marginAll(4))
                    ],
                  ),
                  Visibility(
                    visible:_visible,
                    child: addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    color: AppColors.helpDeskColor),
                  ),
                ],
              ),
            ),
            addHeight(12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          flex: 120,
                          child: addBoldTxt('How to secure my payment details?',maxLines: 2,fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600)),
                      Spacer(),
                      GestureDetector(
                          onTap: _toggle,
                          child: Icon(_visible?Icons.remove:Icons.add,color: AppColors.greyColor,).marginAll(4))
                    ],
                  ),
                  Visibility(
                    visible:_visible,
                    child: addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    color: AppColors.helpDeskColor),
                  ),
                ],
              ),
            ),
            addHeight(20),
            Center(child: addBoldTxt('You still have a question?',fontSize: 18,color: AppColors.primaryColor)),
            addRegularTxt('If you cannot find answer to your question in our FAQ, you can always contact us. We will answer to you shortly!',
            textAlign: TextAlign.center,
            fontSize: 12,
            color: AppColors.helpDeskColor),

            addHeight(20),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.chatIcon).marginOnly(bottom: 10),
                  addBoldTxt('Chat with Us',fontSize: 14,color: AppColors.primaryColor).marginOnly(bottom: 10),
                  addRegularTxt('We are always happy to help.',fontSize: 14,color: AppColors.helpDeskColor)
                ],
              ),
            ),

            addHeight(20),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.txtFieldFillColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.mailIcon,color: AppColors.helpDeskColor2,).marginOnly(bottom: 10),
                  addBoldTxt('Chat with Us',fontSize: 14,color: AppColors.helpDeskColor2).marginOnly(bottom: 10),
                  addRegularTxt('We are always happy to help.',fontSize: 14,color: AppColors.helpDeskColor)
                ],
              ),
            ),
               addHeight(20),


          ],
        ).marginSymmetric(horizontal: 20),
      ),
    );
  }
}

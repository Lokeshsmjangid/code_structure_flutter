import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
        body: GetBuilder(
      init: ProfileController(),
      initState: (_) {},
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              addHeight(50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addHeadingTxtMedium('My Profile', fontSize: 18.sp, fontWeight: FontWeight.w200, color: AppColors.primaryColor ),
                ],
              ),
               addHeight(30.h),
               Stack(
                alignment: Alignment.center,
        
                 children: [
                   Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                     color: AppColors.borderColor,
                     width: 2.sp
                      )
                    ),
                    // radius: 90,                
                    // backgroundColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: AppColors.whiteColor,
                        child: Image.asset(AppAssets.profileUserIcon),
                      ),
                    ),
                   ),
                   Positioned(
                    bottom: 5,
                    right: 0,
                    left: 110.h,
                    child: SvgPicture.asset(AppAssets.editIcon,height: 40.h,))
                 ],
               ),
               addHeight(20.h),
               addBoldTxt("Jenny Wilson", color: AppColors.primaryColor, fontSize: 18.sp),
                addHeight(10.h),
               addRegularTxt("jenny_wilson@mail.com", color: AppColors.greyColor2, fontSize: 14.sp),
                addHeight(20.h),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 12.h
                  ),
                  child: Container(                    
                    // height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.h),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )                      
                    ),
                    child:                     
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.h),
                              topRight: Radius.circular(20.h)
                             ),
                            color: AppColors.greyColor3,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              addWidth(20.h),
                              addRegularTxt('General Settings', fontSize: 14.sp, color: AppColors.blackColor2),
                              
                            ],
                          ),
                      ),                                                                                                              
                      addHeight(10),
                      subScreen("About Me", () { }),
                      subScreen("Change Password", () { }),
                      subScreen("Purchased Items ", () { }),
                      subScreen("Manage Subscription", () { 
                        Get.toNamed(AppRoutes.subscriptionScreen);
                      }, divide: false),
                      addHeight(10.h),
                    ]),
                  ),
                ),
                addHeight(30.sp),
                 Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 12.h
                  ),
                  child: Container(                    
                    // height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.h),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )                      
                    ),
                    child:                     
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.h),
                              topRight: Radius.circular(20.h)
                             ),
                            color: AppColors.greyColor3,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              addWidth(20.h),
                              addRegularTxt('Information', fontSize: 14.sp, color: AppColors.blackColor2),
                              
                            ],
                          ),
                      ),                                                                                                              
                      addHeight(10),
                      // subScreen("About Me", () { }),
                      subScreen("Terms & Conditions", () { }),
                      subScreen("Privacy Policy", () { 
                        
                      }),
                       subScreen("Helpdesk", () { 
                        Get.toNamed(AppRoutes.helpDeskScreen);
                      }),
                      subScreen("Share This App", () { }, divide: false),
                      addHeight(10.h),
                    ]),
                  ),
                ),
            ],
          ),
        );
      },
    ));
  }


  subScreen(
    String title,
    void Function() onTap,
    {bool divide = true}
  ){
    return InkWell(
      onTap: onTap,
      child: Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: 12.sp,
                            horizontal: 6.sp
                          ),
                          child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [                                
                                    Expanded(child: addHeadingTxtMedium(title,
                                        // maxLines: 2,
                                        color: AppColors.primaryColor,
                                        overflow: TextOverflow.ellipsis,fontSize: 16.sp)),
                                         SvgPicture.asset(AppAssets.rightArrowIcon),   
                        
                                  ],
                                ),
                                addHeight(5),
                                if(divide)
                                Divider(color: AppColors.greyColor,)
                        
                              ],
                            ).marginSymmetric(horizontal: 16),
                        ),
    );
  }
}

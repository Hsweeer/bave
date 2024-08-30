

import 'package:bon_achat/view/auth/signin_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import 'signup_screen.dart';  // Import your sign-up screen here

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: AppColor.green,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h), // Space for the top part (e.g., status bar)
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.close, color: AppColor.white, size: 24.w),
                onPressed: () {
                  // Handle close button action
                },
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 203.w,
                    height: 62.h,
                    child: Image.asset(
                      AppImages.splash,color: AppColor.orange,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'CREATE YOUR NEW ACCOUNT',
                    style: lemonMilkWithColor700(AppColor.white, 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  _buildSocialButton(
                    'JOIN WITH GOOGLE',
                    AppImages.google,
                    AppColor.white,
                    AppColor.green,
                  ),
                  SizedBox(height: 20.h),
                  _buildSocialButton(
                    'JOIN WITH FACEBOOK',
                    AppImages.fb,
                    AppColor.white,
                    AppColor.green,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'OR',
                    style: lemonMilkWithColor500(AppColor.white, 16.sp),
                  ),
                  SizedBox(height: 20.h),
                  _buildButton(
                    'SIGNUP',
                    AppColor.green,
                    AppColor.white,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()), // Replace SignUpScreen() with your actual sign-up screen class
                      );
                    },
                  ),
                  SizedBox(height: 220.h),
                  _buildButton(
                    'SIGN IN',
                    AppColor.orange,
                    AppColor.white,
                        () {
                      // Handle sign-in button action
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreenmain()), // Replace SignUpScreen() with your actual sign-up screen class
                          );

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, String iconPath, Color textColor, Color bgColor) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: textColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(iconPath, height: 22.h, width: 22.w),
            SizedBox(width: 55.w),
            Text(
              text,
              style: lemonMilkWithColor500(textColor, 16.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: textColor),
        ),
        child: Center(
          child: Text(
            text,
            style: lemonMilkWithColor500(textColor, 16.sp),
          ),
        ),
      ),
    );
  }
}

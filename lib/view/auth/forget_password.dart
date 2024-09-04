import 'package:bon_achat/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';
import '../account/change_password.dart';
import 'otp_verification.dart';

class forgetpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColor.black, size: 20.w),
                      onPressed: () {
                        // Handle back button action
                        Navigator.pop(context);
                      },
                    ),                    SizedBox(width: 8.w),
                    Text(
                      "FORGOT PASSWORD",
                      style: lemonMilk500( 18.sp,AppColor.black,),
                    ),
                  ],
                ),
              ),
              Text(
                "Enter the email address to get verification code \nto reset password",
                style: lemonMilkWithColor500(AppColor.grey, 11.sp),
              ),
              SizedBox(height: 75.h),
              _buildTextField('Email address', Icons.email),

              Spacer(),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => otpVerificationScreen()), // Replace SignUpScreen with your sign-up page
                    );
                  },
                  child: Text(
                    "SEND CODE",
                    style: lemonMilk600(AppColor.white, 15.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.h,)

            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildTextField(String hintText, IconData icon, {bool obscureText = false, String? prefixText}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
      prefixIcon: prefixText != null
          ? Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        width: 90.w,
        child: Text(
          prefixText,
          style: lemonMilkWithColor500(AppColor.black, 14.sp),
        ),
      )
          : Icon(icon, color: AppColor.grey, size: 20.w),
      suffixIcon: obscureText ? Icon(Icons.visibility_off, color: AppColor.grey, size: 20.w) : null,
      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.lightGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.lightGreen),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.lightGreen),
      ),
    ),
    style: lemonMilkWithColor500(AppColor.black, 14.sp),
  );
}

// Your SignUpScreen Widget (Replace with your actual sign-up page)


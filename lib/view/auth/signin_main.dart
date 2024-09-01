import 'package:bon_achat/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';
import 'forget_password.dart';

class SignInScreenmain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColor.black),
                      onPressed: () {
                        // Handle back action.
                        Navigator.pop(context);

                      },
                    ),                    SizedBox(width: 8.w),
                    Text(
                      "SIGN IN",
                      style: lemonMilk600(AppColor.black, 20.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),

              // Phone Number Input
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text("+1", style: lemonMilk500(16.sp, AppColor.grey)),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  hintText: "PHONE NUMBER",
                  hintStyle: lemonMilk500(12.sp, AppColor.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColor.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColor.green), // Green color when focused
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),

              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, color: AppColor.grey),
                  suffixIcon: Icon(Icons.visibility_off_outlined, color: AppColor.grey),
                  hintText: "PASSWORD",
                  hintStyle: lemonMilk500(12.sp, AppColor.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColor.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColor.green), // Green color when focused
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgetpassword()), // Replace SignUpScreen with your sign-up page
                    );
                  },
                  child: Text(
                    "FORGOT PASSWORD?",
                    style: lemonMilkWithColor700(AppColor.green, 14.sp),
                  ),
                ),
              ),
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
                      MaterialPageRoute(builder: (context) => HomePagenav()), // Replace SignUpScreen with your sign-up page
                    );
                  },
                  child: Text(
                    "SIGN IN",
                    style: lemonMilk600(AppColor.white, 18.sp),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Sign Up Link with GestureDetector for Navigation
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the SignUpScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()), // Replace SignUpScreen with your sign-up page
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "DON'T YOU HAVE AN ACCOUNT? ",
                      style: lemonMilk400(AppColor.grey, 14.sp),
                      children: [
                        TextSpan(
                          text: "SIGN UP",
                          style: lemonMilk600(AppColor.green, 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

// Your SignUpScreen Widget (Replace with your actual sign-up page)


import 'package:bon_achat/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';
import 'forget_password.dart';

class resetpassword extends StatelessWidget {
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
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "RESET PASSWORD",
                      style: lemonMilk600(AppColor.black, 20.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
Text(
  "Create a new password",
  style: lemonMilk400(AppColor.black, 12.sp),
),
              // Phone Number Input
              SizedBox(height: 10.h),

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

              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, color: AppColor.grey),
                  suffixIcon: Icon(Icons.visibility_off_outlined, color: AppColor.grey),
                  hintText: "CONFIRM PASSWORD",
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
                    "CONTINUE",
                    style: lemonMilk600(AppColor.white, 18.sp),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// Your SignUpScreen Widget (Replace with your actual sign-up page)


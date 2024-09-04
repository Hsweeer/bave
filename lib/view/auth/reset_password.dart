import 'package:bon_achat/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';
import 'forget_password.dart';

class resetpassword extends StatefulWidget {
  @override
  _resetpasswordState createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  // State variables to control password visibility
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                      style: lemonMilk500( 18.sp,AppColor.black,),
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
              SizedBox(height: 15.h),
              // Password Input
              _buildPasswordField(
                label: ' PASSWORD',

                isVisible: _isPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              SizedBox(height: 16.h),
              _buildPasswordField(
                label: 'CONFIRM PASSWORD',

                isVisible: _isPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              // Confirm Password Input

              Spacer(),

              // Continue Button
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
                      MaterialPageRoute(builder: (context) => HomePagenav()), // Navigate to HomePage
                    );
                  },
                  child: Text(
                    "CONTINUE",
                    style: lemonMilk500( 15.sp,AppColor.white,),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildPasswordField({
    required String label,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Container(
      height: 55.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.lightGreen),
      ),
      child: Row(
        children: [
          Icon(Icons.lock, color: AppColor.grey),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              obscureText: !isVisible,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15.h), // Adjust this value to align text
                hintText: label,
                hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: onVisibilityToggle,
            child: Icon(
              isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bon_achat/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';
import 'forget_password.dart';

class SignInScreenmain extends StatefulWidget {
  @override
  _SignInScreenmainState createState() => _SignInScreenmainState();
}

class _SignInScreenmainState extends State<SignInScreenmain> {
  bool _isPasswordVisible = false;

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
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "SIGN IN",
                      style: lemonMilk600(AppColor.black, 18.sp),
                    ),
                  ],
                ),
              ),

              // Phone Number Input
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 45.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColor.lightGreen),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '+1',
                          style:lemonMilkWithColor500(AppColor.grey, 15.sp),

                  ),
                        SizedBox(width: 8.0),
                        Image.asset(
                          AppImages.line,
                          height: 25.h,
                          width: 1.5.w,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'PHONE NUMBER',
                              hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              _buildPasswordField(
                label: ' PASSWORD',

                isVisible: _isPasswordVisible,
                onVisibilityToggle: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgetpassword()),
                    );
                  },
                  child: Text(
                    "FORGOT PASSWORD?",
                    style: lemonMilk600(AppColor.green, 12.sp),
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
                      MaterialPageRoute(builder: (context) => HomePagenav()),
                    );
                  },
                  child: Text(
                    "SIGN IN",
                    style: lemonMilk600(AppColor.white, 15.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Sign Up Link with GestureDetector for Navigation
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "DON'T YOU HAVE AN ACCOUNT? ",
                      style: lemonMilk400(AppColor.grey, 12.sp),
                      children: [
                        TextSpan(
                          text: "SIGN UP",
                          style: lemonMilk600(AppColor.green, 12.sp),
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
  Widget _buildPasswordField({
    required String label,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Container(
      height: 45.w,
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
              style: lemonMilkWithColor500(AppColor.grey, 12.sp), // Ensuring the text style matches
              decoration: InputDecoration(
                hintText: label,
                hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
                border: InputBorder.none,
                isDense: true,  // Reduces padding
                contentPadding: EdgeInsets.zero, // Ensures hint text aligns properly
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

// Widget _buildPasswordField({
  //   required String label,
  //   required bool isVisible,
  //   required VoidCallback onVisibilityToggle,
  // }) {
  //   return Container(
  //     height: 55.w,
  //     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8.r),
  //       border: Border.all(color: AppColor.lightGreen),
  //     ),
  //     child: Row(
  //       children: [
  //         Icon(Icons.lock, color: AppColor.grey),
  //         SizedBox(width: 10.w),
  //         Expanded(
  //           child: TextField(
  //             obscureText: !isVisible,
  //             decoration: InputDecoration(
  //               hintText: label,
  //               hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
  //               border: InputBorder.none,
  //             ),
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: onVisibilityToggle,
  //           child: Icon(
  //             isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
  //             color: AppColor.grey,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}

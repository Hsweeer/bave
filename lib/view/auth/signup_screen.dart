import 'package:bon_achat/view/auth/phone_verification.dart';
import 'package:bon_achat/view/auth/signin_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/colors.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColor.black, size: 24.w),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8.w), // Space between icon and text
                  Text(
                    'JOIN WITH EMAIL',
                    style: lemonMilkWithColor800(AppColor.black, 18.sp),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              _buildTextField('FULL NAME', Icons.person),
              SizedBox(height: 20.h),
              _buildTextField('PHONE NUMBER', Icons.phone, prefixText: '+1  '),
              SizedBox(height: 20.h),
              _buildTextField('EMAIL', Icons.email),
              SizedBox(height: 20.h),
              _buildTextField('PASSWORD', Icons.lock, obscureText: !_isPasswordVisible, isPasswordField: true),
              SizedBox(height: 20.h),
              _buildTextField('CONFIRM PASSWORD', Icons.lock, obscureText: !_isConfirmPasswordVisible, isPasswordField: true),
              SizedBox(height: 20.h), // Space before the button
              _buildSignUpButton(),
              SizedBox(height: 10.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ALREADY HAVE AN ACCOUNT?',
                      style: lemonMilk400(AppColor.black, 14.sp),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInScreenmain()),
                        );
                      },
                      child: Text(
                        'SIGN IN',
                        style: lemonMilkWithColor500(AppColor.green, 14.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h), // Space after the sign in link
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, {bool obscureText = false, String? prefixText, bool isPasswordField = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lemonMilkWithColor500(AppColor.grey, 14.sp),
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
        suffixIcon: isPasswordField
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColor.grey,
          ),
          onPressed: () {
            setState(() {
              if (hintText == 'PASSWORD') {
                _isPasswordVisible = !_isPasswordVisible;
              } else if (hintText == 'CONFIRM PASSWORD') {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              }
            });
          },
        )
            : null,
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

  Widget _buildSignUpButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PhoneNumberVerificationScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColor.orange,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            'SIGN UP',
            style: lemonMilkWithColor500(AppColor.white, 16.sp),
          ),
        ),
      ),
    );
  }
}

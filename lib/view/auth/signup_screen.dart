import 'package:bon_achat/const/images.dart';
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
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
        Text(
          'JOIN WITH EMAIL',
          style: lemonMilkWithColor800(AppColor.black, 18.sp),
        ),
        centerTitle: false, // Ensures the title is left-aligned next to the leading icon

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('FULL NAME', AppImages.user,), // Replace with your image path
              SizedBox(height: 10.h),
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
              _buildTextField('EMAIL', AppImages.email), // Replace with your image path
              SizedBox(height: 14.h),
              _buildTextField('PASSWORD', AppImages.Lock, obscureText: !_isPasswordVisible, isPasswordField: true), // Replace with your image path
              SizedBox(height: 14.h),
              _buildTextField('CONFIRM PASSWORD', AppImages.Lock, obscureText: !_isConfirmPasswordVisible, isPasswordField: true), // Replace with your image path
              SizedBox(height: 290.h), // Space before the button
              _buildSignUpButton(),
              SizedBox(height: 20.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ALREADY HAVE AN ACCOUNT?',
                      style: lemonMilk400(AppColor.black2, 12.sp),
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
                        style: lemonMilkWithColor500(AppColor.green, 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h), // Space after the sign in link
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, String imagePath, {bool obscureText = false, String? prefixText, bool isPasswordField = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
        prefixIcon: prefixText != null
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          alignment: Alignment.center,

          width: 30.w,
          child: Text(
            prefixText,
            style: lemonMilkWithColor500(AppColor.black, 12.sp),
          ),
        )
            : Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                        imagePath,
                        color: Color.fromRGBO(162, 162, 162, 1),
                        width: 18.w, // Adjust size as needed
                        height: 13.h, // Adjust size as needed
                      ),
            ),
        suffixIcon: isPasswordField
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Color.fromRGBO(162, 162, 162, 1),
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
      style: lemonMilkWithColor500(AppColor.black, 12.sp),
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
            style: lemonMilkWithColor500(AppColor.white, 15.sp),
          ),
        ),
      ),
    );
  }
}

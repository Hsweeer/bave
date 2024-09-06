

import 'package:bon_achat/view/auth/signin_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import 'signup_screen.dart';  // Import your sign-up screen here

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _selectedLanguage = 'ENGLISH';
  bool _isExpanded = false;

  final List<String> _languages = ['ENGLISH', 'FRENCH'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: AppColor.green,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h), // Space for the top part (e.g., status bar)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: AppColor.white, size: 28.w),
                    onPressed: () {
                      // Handle close button action
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 85.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedLanguage,
                            dropdownColor: AppColor.white,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLanguage = newValue!;
                              });
                            },
                            items: _languages.map<DropdownMenuItem<String>>((String language) {
                              return DropdownMenuItem<String>(
                                value: language,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                  child: Text(
                                    language,
                                    style: lemonMilk400(AppColor.black, 10.sp),
                                  ),
                                ),
                              );
                            }).toList(),
                            selectedItemBuilder: (BuildContext context) {
                              return _languages.map((String language) {
                                return Row(
                                  children: [
                                    Container(
                                      width: 85.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: AppColor.orange,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                        child: Row(
                                          children: [
                                            Image.asset(AppImages.globe, height: 12.h, width: 12.w),
                                            SizedBox(width: 4.w),
                                            Text(
                                              _selectedLanguage,
                                              style: lemonMilk400(AppColor.white, 10.sp),
                                            ),
                                            Icon(Icons.arrow_drop_down, size: 14.h, color: AppColor.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList();
                            },
                            isExpanded: true,
                            icon: SizedBox.shrink(),  // This removes the default arrow icon
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
              SizedBox(height: 30.h),
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
                    SizedBox(height: 30.h),
                    Text(
                      'CREATE YOUR NEW ACCOUNT',
                      style: lemonMilk400(AppColor.white, 15.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
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
                    SizedBox(height: 30.h),
                    Text(
                      'OR',
                      style: lemonMilk400(AppColor.white, 15.sp),
                    ),
                    SizedBox(height: 30.h),
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
                    SizedBox(height: 200.h),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the new screen
                        Get.to(SignInScreenmain());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 62.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.orange,
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN IN',
                                    style: lemonMilk500(15.sp, AppColor.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
            SizedBox(width: 5.w,),
            Image.asset(iconPath, height: 22.h, width: 22.w),
            SizedBox(width: 55.w),
            Text(
              text,
              style: lemonMilkWithColor500(textColor, 12.sp),
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
            style: lemonMilkWithColor500(textColor, 12.sp),
          ),
        ),
      ),
    );
  }
}

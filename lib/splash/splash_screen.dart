import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/colors.dart';
import '../const/images.dart';
import '../const/text_style.dart';
import '../view/auth/signin_screen.dart';
import '../view/home/HomePagenavv.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer for 3 seconds before navigating to the next page
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        // builder: (context) => HomePagenav(), // Replace with your next page widget
        builder: (context) => SignInScreen(), // Replace with your next page widget
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: AppColor.orange,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 273.w,
                  height: 82.h,
                  child: Image.asset(
                    AppImages.splash, // Replace with your logo asset
                    height: 120.h,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


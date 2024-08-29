import 'package:bon_achat/view/home/ads/my_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Base size for your design
      builder: (context, child) {
        return MaterialApp(
          home: MyAdsPage(),
        );
      },
    );
  }
}

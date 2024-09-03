import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool isEnglishSelected = true; // State to track English selection
  bool isFrenchSelected = false; // State to track French selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.black),
          onPressed: () {
            // Handle back action
            Navigator.pop(context);
          },
        ),
        title: Text(
          'CHANGE LANGUAGE',
          style: lemonMilkWithColor800(AppColor.black, 20.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CHOOSE YOUR PROFFERED LANGUAGE',
              style: lemonMilkWithColor500(AppColor.grey, 14.sp),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ENGLISH',
                  style: lemonMilkWithColor800(AppColor.black, 18.sp),
                ),
                Switch(
                  value: isEnglishSelected,
                  activeColor: AppColor.orange,
                  activeTrackColor: AppColor.green,
                  inactiveThumbColor: AppColor.orange,
                  inactiveTrackColor: AppColor.lightGrey,
                  onChanged: (bool value) {
                    setState(() {
                      isEnglishSelected = value;
                      isFrenchSelected = !value; // Toggle French based on English
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FRENCH',
                  style: lemonMilkWithColor800(AppColor.black, 18.sp),
                ),
                Switch(
                  value: isFrenchSelected,
                  activeColor: AppColor.orange,
                  activeTrackColor: AppColor.green,
                  inactiveThumbColor: AppColor.orange,
                  inactiveTrackColor: AppColor.lightGrey,
                  onChanged: (bool value) {
                    setState(() {
                      isFrenchSelected = value;
                      isEnglishSelected = !value; // Toggle English based on French
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

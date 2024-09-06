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
        title: Column(
          children: [
            Text(
              'CHANGE LANGUAGE',
              style: lemonMilkWithColor500(AppColor.black, 18.sp),
            ),
            SizedBox(height: 2.h),


          ],
        ),
        centerTitle: false, // Ensures the title is left-aligned next to the leading icon

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CHOOSE YOUR PROFFERED LANGUAGE',
              style: lemonMilkWithColor500(AppColor.grey, 12.sp),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ENGLISH',
                  style: lemonMilkWithColor500(Color.fromRGBO(26, 27, 45, 1),
                 15.sp),
                ),
                SizedBox(
                  height: 40.h, // Adjust the height of the container
                  width: 60.w, // Adjust the width of the container
                  child: Transform.scale(
                    scale: 0.8, // Scale factor to adjust the size of the switch
                    child: Switch(
                      value: isEnglishSelected,
                      activeColor: AppColor.orange,
                      activeTrackColor: AppColor.green,
                      inactiveThumbColor: AppColor.orange,
                      inactiveTrackColor: Color.fromRGBO(221, 221, 221, 1), // Custom track color
                      onChanged: (bool value) {
                        setState(() {
                          isEnglishSelected = value;
                          isFrenchSelected = !value; // Toggle French based on English
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          // isEnglishSelected = value;
          // isFrenchSelected = !value; // Toggle French based on English
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FRENCH',
                  style: lemonMilkWithColor500(Color.fromRGBO(26, 27, 45, 1), 15.sp),
                ),
                SizedBox(
                  height: 40.h, // Adjust the height of the container
                  width: 60.w, // Adjust the width of the container
                  child: Transform.scale(
                    scale: 0.8, // Scale factor to adjust the size of the switch
                    child: Switch(
                      value: isFrenchSelected,
                      activeColor: AppColor.orange,
                      activeTrackColor: AppColor.green,
                      inactiveThumbColor: AppColor.orange,
                      inactiveTrackColor: Color.fromRGBO(221, 221, 221, 1), // Custom track color
                      onChanged: (bool value) {
                        setState(() {
                          isFrenchSelected = value;
                          isEnglishSelected = !value; // Toggle English based on French
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

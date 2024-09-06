import 'package:bon_achat/const/colors.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'NOTIFICATIONS',
              style: lemonMilk500(25.sp, Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: ListView(
          children: [
            // First Notification Tile
            Container(
              color: AppColor.green,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              margin: EdgeInsets.only(bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AD APPROVED',
                    style: lemonMilk500(15.sp, Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'CONGRATULATION! YOUR AD HAS BEEN APPROVED.',
                          style: lemonMilk500(10.sp, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle action here
                    },
                    child:
                    Text(
                      'VIEW AD',
                      style: lemonMilk400(
                        AppColor.orange,
                        10.sp,
                      ).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.orange, // Sets the underline color to match the text color
                        decorationThickness: 1.5, // Adjust the thickness of the underline if needed
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '1H AGO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              margin: EdgeInsets.only(bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AD REJECTED',
                    style: lemonMilk500(15.sp, Colors.black),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'YOUR AD HAS BEEN REJECTED.',
                          style: lemonMilk500(9.sp, Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '1H AGO',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 4,
              color: Color.fromRGBO(0, 0, 0, 0.08),
              thickness: 1,
            ),

            // Third Notification Tile
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              margin: EdgeInsets.only(bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MARKED AS SOLD',
                    style: lemonMilk500(15.sp, Colors.black),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'YOUR AD HAS BEEN SUCCESSFULLY MARKED AS SOLD',
                          style: lemonMilk500(9.sp, Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                      ),
                        )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '1H AGO',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0,0.5 ),
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 4,
              color: Color.fromRGBO(0, 0, 0, 0.08),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

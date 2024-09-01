import 'package:bon_achat/const/colors.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'NOTIFICATIONS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: ListView(
          children: [
            NotificationTile(
              title: 'AD APPROVED',
              description: 'CONGRATULATION! YOUR AD HAS BEEN APPROVED.',
              actionText: 'VIEW AD',
              backgroundColor: AppColor.green,
              timeAgo: '1H AGO',
            ),
            NotificationTile(
              title: 'AD REJECTED',
              description: 'YOUR AD HAS BEEN REJECTED.',
              backgroundColor: Colors.white,
              timeAgo: '1H AGO',
            ),
            NotificationTile(
              title: 'MARKED AS SOLD',
              description: 'YOUR AD HAS BEEN SUCCESSFULLY MARKED AS SOLD',
              backgroundColor: Colors.white,
              timeAgo: '1H AGO',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String? actionText;
  final Color backgroundColor;
  final String timeAgo;

  NotificationTile({
    required this.title,
    required this.description,
    this.actionText,
    required this.backgroundColor,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          margin: EdgeInsets.only(bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: backgroundColor == Colors.white ? Colors.black : Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        color: backgroundColor == Colors.white ? Colors.grey : Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              if (actionText != null)
                GestureDetector(
                  onTap: () {
                    // Handle action here
                  },
                  child: Text(
                    actionText!,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  timeAgo,
                  style: TextStyle(
                    color: backgroundColor == Colors.white ? Colors.grey : Colors.white,
                    fontSize: 8.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

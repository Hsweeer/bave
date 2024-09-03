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
              style: lemonMilk500(25.sp, Colors.black)
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
                style: lemonMilk500(15.sp, backgroundColor == Colors.white ? Colors.black : Colors.white,
                )
              ),
              SizedBox(height: 0.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style:lemonMilk500(9.sp,  backgroundColor == Colors.white ? Colors.black : Colors.white,)
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
                    style: lemonMilk500(8.sp, AppColor.orange)
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

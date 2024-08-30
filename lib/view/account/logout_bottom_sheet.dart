import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';

class LogoutBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColor.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'LOG OUT',
            style: lemonMilkWithColor800(AppColor.white, 18.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            'ARE YOU SURE YOU WANT TO LOG OUT\nFROM YOUR ACCOUNT?',
            textAlign: TextAlign.center,
            style: lemonMilkWithColor500(AppColor.white, 13.sp),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNoButton(context),
              _buildYesButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoButton(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColor.black, backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            side: BorderSide(color: AppColor.white),
            padding: EdgeInsets.symmetric(vertical: 14.h),
          ),
          onPressed: () {
            // Handle "No" action.
            Navigator.pop(context);
          },
          child: Text(
            'NO',
            style: lemonMilkWithColor800(AppColor.black, 14.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildYesButton(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColor.white, backgroundColor: AppColor.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 14.h),
          ),
          onPressed: () {
            // Handle "Yes, Log Out" action.
            Navigator.pop(context);
          },
          child: Text(
            'YES, LOG OUT',
            style: lemonMilkWithColor800(AppColor.white, 14.sp),
          ),
        ),
      ),
    );
  }
}

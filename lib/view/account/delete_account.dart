import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';

class DeletetBottomSheet extends StatelessWidget {
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
            'DELETE ACCOUNT',
            style: lemonMilkWithColor800(AppColor.white, 18.sp),
          ),
          Divider(
            color: AppColor.dull_white2, // Set the color of the divider
            thickness: 0.5, // Set the thickness of the divider (width)
            indent: 16.0, // Set the space before the divider starts (optional)
            endIndent: 16.0, // Set the space after the divider ends (optional)
          ),
          SizedBox(height: 10.h),
          Text(
            'Are you sure you want to permanently\n delete your account?',
            textAlign: TextAlign.center,
            style: lemonMilk400(AppColor.dull_white, 13.sp),
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
            foregroundColor: AppColor.dull_white, backgroundColor: AppColor.red,
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
            'YES, DELETE',
            style: lemonMilkWithColor800(AppColor.white, 14.sp),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Adjust this to your screen design size.
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColor.black),
              onPressed: () {
                // Handle back action.
                Navigator.pop(context);

              },
            ),
            title: Text(
              'CHANGE PASSWORD',
              style: lemonMilkWithColor800(AppColor.black, 18.sp),
            ),
            centerTitle: false,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  'CREATE A NEW PASSWORD FOR YOUR ACCOUNT',
                  style: lemonMilkWithColor500(AppColor.grey, 12.sp),
                ),
                SizedBox(height: 30.h),
                _buildPasswordField('OLD PASSWORD'),
                SizedBox(height: 10.h),
                _buildPasswordField('NEW PASSWORD'),
                SizedBox(height: 10.h),
                _buildPasswordField('CONFIRM PASSWORD'),
                Spacer(),
                _buildContinueButton(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordField(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.lightGreen),
      ),
      child: Row(
        children: [
          Icon(Icons.lock, color: AppColor.grey),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              label,
              style: lemonMilkWithColor500(AppColor.grey, 12.sp),
            ),
          ),
          Icon(Icons.visibility_off_outlined, color: AppColor.grey),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: 342.w,
      height: 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {
          // Handle continue action.
        },
        child: Text(
          'CONTINUE',
          style: lemonMilkWithColor800(AppColor.white, 16.sp),
        ),
      ),
    );
  }
}

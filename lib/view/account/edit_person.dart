import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';

class EditPersonalInfoScreen extends StatelessWidget {
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'EDIT PERSONAL INFO',
          style: lemonMilkWithColor800(AppColor.black, 18.sp),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Text(
              'EDIT PERSONAL DETAILS',
              style: lemonMilkWithColor500(AppColor.grey, 14.sp),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.yellow,
                    backgroundImage:
                    AssetImage(AppImages.person), // Replace with your image path
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: AppColor.orange,
                      child: Icon(Icons.camera_alt, color: AppColor.white, size: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                'CHANGE IMAGE',
                style: lemonMilkWithColor700(AppColor.black, 16.sp),
              ),
            ),
            SizedBox(height: 24.h),
            _buildTextField(
              label: 'FULL NAME:',
              icon: Icons.person,
              initialValue: 'CAMERON WILLIAMSON',
            ),
            _buildTextField(
              label: 'PHONE NUMBER:',
              icon: Icons.phone,
              initialValue: '+1 123456798',
            ),
            _buildTextField(
              label: 'EMAIL ADDRESS:',
              icon: Icons.email,
              initialValue: 'someone@gmail.com',
            ),
            _buildTextField(
              label: 'LOCATION:',
              icon: Icons.location_on,
              initialValue: '6391 Elgin St. Celina, Delaware 10299',
            ),
SizedBox(height: 40.h,),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    // Add your save action here
                  },
                  child: Text(
                    'SAVE CHANGES',
                    style: lemonMilkWithColor700(AppColor.white, 16.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String initialValue,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: lemonMilkWithColor700(AppColor.black, 14.sp),
          ),
          SizedBox(height: 4.h),
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppColor.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.lightGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.green),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            ),
            style: lemonMilkWithColor500(AppColor.black, 12.sp),
          ),
        ],
      ),
    );
  }
}

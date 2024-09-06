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
          style: lemonMilkWithColor500(AppColor.black, 18.sp),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Text(
                'EDIT PERSONAL DETAILS',
                style: lemonMilk500( 11.sp,AppColor.black2,),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Colors.yellow,
                      backgroundImage: AssetImage(
                          AppImages.person2), // Replace with your image path
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColor.orange,
                        child: Icon(Icons.camera_alt,
                            color: AppColor.white, size: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  'CHANGE IMAGE',
                  style: lemonMilkWithColor500(AppColor.black, 14.sp),
                ),
              ),
              SizedBox(height: 10.h),
              _buildTextField(
                label: 'FULL NAME:',
                imagePath: AppImages
                    .user_grey, // Ensure to provide the correct image path
                initialValue: 'CAMERON WILLIAMSON',
              ),
              Text(
                'Phone Number:',
                style: lemonMilkWithColor500(AppColor.black, 11.sp),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '+1',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Image.asset(
                          AppImages.line,
                          height: 25.h,
                          width: 1.5.w,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '123456798',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildTextField(
                label: 'EMAIL ADDRESS:',
                imagePath:
                    AppImages.email, // Ensure to provide the correct image path
                initialValue: 'someone@gmail.com',
              ),
              _buildTextField(
                label: 'LOCATION:',
                imagePath: AppImages
                    .location, // Ensure to provide the correct image path
                initialValue: '6391 Elgin St. Celina, Delaware 10299',
              ),
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SizedBox(
                  height: 55.h,
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
                      style: lemonMilkWithColor500(AppColor.white, 15.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String imagePath,
    required String initialValue,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: lemonMilkWithColor700(AppColor.black, 11.sp),
          ),
          SizedBox(height: 4.h),
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(14.w), // Adjust padding as needed
                child: Image.asset(
                  imagePath, // Image path
                  width: 15.w,
                  height: 15.h,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.lightGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.green),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            ),
            style: lemonMilk500( 10.sp,AppColor.black2,),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                Navigator.pop(context);
              },
            ),
            title: Text(
              'CHANGE PASSWORD',
              style: lemonMilkWithColor500(AppColor.black, 18.sp),
            ),
            centerTitle: false,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CREATE A NEW PASSWORD FOR YOUR ACCOUNT',
                  style: lemonMilkWithColor500(AppColor.grey, 12.sp),
                ),
                SizedBox(height: 15.h),
                _buildPasswordField(
                  label: ' OLD PASSWORD',
                  isVisible: _isOldPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isOldPasswordVisible = !_isOldPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 10.h),
                _buildPasswordField(
                  label: ' NEW PASSWORD',
                  isVisible: _isNewPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 10.h),
                _buildPasswordField(
                  label: ' CONFIRM PASSWORD',
                  isVisible: _isConfirmPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
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

  Widget _buildPasswordField({
    required String label,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Container(
      height: 55.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.lightGreen),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Aligns all child widgets to center vertically
        children: [
          Icon(Icons.lock, color: AppColor.grey, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              obscureText: !isVisible,
              decoration: InputDecoration(
                isCollapsed: true, // Ensures the text aligns with the icon
                hintText: label,
                hintStyle: lemonMilkWithColor500(AppColor.grey, 12.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero, // Removes any default padding inside the text field
              ),
              style: lemonMilkWithColor500(AppColor.black, 12.sp), // Text style inside the input
            ),
          ),
          GestureDetector(
            onTap: onVisibilityToggle,
            child: Icon(
              isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColor.grey,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildContinueButton() {
    return SizedBox(
      height: 45.h,
      width: 342.w,
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
          style: lemonMilkWithColor500(AppColor.white, 12.sp),
        ),
      ),
    );
  }
}

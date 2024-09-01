import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../auth/change_password.dart';
import 'delete_account.dart';
import 'edit_person.dart';
import 'logout_bottom_sheet.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ACCOUNT',
                style: lemonMilkWithColor800(AppColor.black, 24.sp),
              ),
              SizedBox(height: 16.h),
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.yellow,
                backgroundImage: AssetImage(AppImages.person),
              ),

              SizedBox(height: 16.h),
              Text(
                'CAMERON WILLIAMSON',
                style: lemonMilkWithColor700(AppColor.black, 20.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              Text(
                'someone123@gmail.com',
                style: lemonMilk400(AppColor.grey, 14.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              _buildAccountOption(
                icon: Icons.person_pin,
                text: 'EDIT PERSONAL INFO',
                textColor: AppColor.black,
                iconColor: AppColor.green,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>EditPersonalInfoScreen(),
                    ),
                  );
                },
              ),
              _buildAccountOption(
                icon: Icons.lock,
                text: 'CHANGE PASSWORD',
                textColor: AppColor.black,
                iconColor: AppColor.green,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>ChangePasswordScreen(),
                    ),
                  );
                },              ),
              _buildAccountOption(
                icon: Icons.logout_sharp,
                text: 'LOG OUT',
                textColor: AppColor.orange,
                iconColor: AppColor.green, // Border color set to green
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent, // Make the background transparent
                    builder: (context) => LogoutBottomSheet(),
                  );

                },
              ),
              _buildAccountOption(
                icon: Icons.delete,
                text: 'DELETE ACCOUNT',
                textColor: AppColor.red,
                iconColor: AppColor.red, // Border color set to green
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent, // Make the background transparent
                    builder: (context) => DeletetBottomSheet(),
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String text,
    required Color textColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.lightGreen), // Border color set to green for all options
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 24.sp),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  text,
                  style: lemonMilkWithColor500(textColor, 12.sp),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: iconColor, size: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}

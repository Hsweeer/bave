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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
        Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'ACCOUNT',
              style: lemonMilkWithColor800(AppColor.black, 24.sp),
            ),
          ],
        ),

      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 16.h),
              CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors.yellow,
                backgroundImage: AssetImage(AppImages.person),
              ),
              SizedBox(height: 16.h),
              Text(
                'CAMERON WILLIAMSON',
                style: lemonMilkWithColor700(AppColor.black, 18.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              Text(
                'someone123@gmail.com',
                style: lemonMilk400(AppColor.grey, 10.sp),
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
                      builder: (context) => EditPersonalInfoScreen(),
                    ),
                  );
                },
                imagePath: AppImages.user, // Ensure to provide the correct image path
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
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
                },
                imagePath: AppImages.lock, // Ensure to provide the correct image path
              ),
              _buildAccountOption(
                icon: Icons.logout_sharp,
                text: 'Change Language',
                textColor: AppColor.black,
                iconColor: AppColor.green,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => LogoutBottomSheet(),
                  );
                },
                imagePath: AppImages.globe, // Ensure to provide the correct image path
              ),
              _buildAccountOption(
                icon: Icons.logout_sharp,
                text: 'LOG OUT',
                textColor: AppColor.orange,
                iconColor: AppColor.green,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => LogoutBottomSheet(),
                  );
                },
                imagePath: AppImages.logout, // Ensure to provide the correct image path
              ),
              _buildAccountOption(
                icon: Icons.delete,
                text: 'DELETE ACCOUNT',
                textColor: AppColor.red,
                iconColor: AppColor.red,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => DeletetBottomSheet(), // Ensure to provide the correct class name
                  );
                },
                imagePath: AppImages.delete, // Ensure to provide the correct image path
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
    required String imagePath, // Added parameter for the image path
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.lightGreen),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Center(
                  child: Image.asset(
                    imagePath, // Image path
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain, // Changed fit to contain
                  ),
                ),
              ),
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

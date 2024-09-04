import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import 'change_password.dart';
import 'delete_account.dart';
import 'edit_person.dart';
import 'language_change.dart';
import 'logout_bottom_sheet.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,  // Disable the back arrow
        title: Row(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55.r,
                  backgroundColor: Colors.yellow,
                  backgroundImage: AssetImage(AppImages.person),
                ),
                SizedBox(height: 10.h),
                Text(
                  'CAMERON WILLIAMSON',
                  style: lemonMilkWithColor500(AppColor.black, 18.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  'someone123@gmail.com',
                  style: lemonMilkWithColor500(AppColor.grey, 10.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                _buildAccountOption(
                  icon: Icons.person_pin,
                  text: 'EDIT PERSONAL INFO',
                  textColor: AppColor.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPersonalInfoScreen(),
                      ),
                    );
                  },
                  imagePath: AppImages.user,
                ),
                _buildAccountOption(
                  icon: Icons.lock,
                  text: 'CHANGE PASSWORD',
                  textColor: AppColor.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                  },
                  imagePath: AppImages.Lock,
                ),
                _buildAccountOption(
                  icon: Icons.logout_sharp,
                  text: 'Change Language',
                  textColor: AppColor.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeLanguageScreen(),
                      ),
                    );
                  },
                  imagePath: AppImages.globe,
                ),
                _buildAccountOption(
                  icon: Icons.logout_sharp,
                  text: 'LOG OUT',
                  textColor: AppColor.orange,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => LogoutBottomSheet(),
                    );
                  },
                  imagePath: AppImages.logout,
                ),
                _buildAccountOption(
                  icon: Icons.delete,
                  text: 'DELETE ACCOUNT',
                  textColor: AppColor.red,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => DeletetBottomSheet(),
                    );
                  },
                  imagePath: AppImages.delete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String text,
    required Color textColor,
    required VoidCallback onTap,
    required String imagePath,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
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
                  color: icon == Icons.delete ? AppColor.red : AppColor.green,
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  text,
                  style: lemonMilk500(11.sp, textColor),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: icon == Icons.delete ? AppColor.red : AppColor.green, size: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}

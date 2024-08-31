import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.green),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'What are you looking for?',
                            hintStyle: lemonMilk400(AppColor.black2, 10.sp),
                            border: InputBorder.none,  // Removes the default border
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.orange,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppImages.search,
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Center(
                child: Image.asset(
                  AppImages.searchscr,  // Replace `AppImages.centerImage` with your actual image path.
                  width: 160.w,  // Adjust the width as needed
                  height: 100.h,  // Adjust the height as needed
                  fit: BoxFit.contain,  // Adjust the fit as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

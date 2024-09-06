import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../const/colors.dart';
import '../const/text_style.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          // Custom "Pending Ads" Tab
          Expanded(
            child: GestureDetector(
              onTap: () {
                tabController.animateTo(0); // Switch to the first tab
              },
              child: Obx(() {
                bool isSelected = tabController.index == 0;
                return Container(
                  height: 42.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Pending Ads",
                    style: lemonMilk500(
                      12.sp,
                      isSelected ? AppColor.white : AppColor.grey,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(width: 8.w), // Add some space between the tabs

          // Custom "Active Ads" Tab
          Expanded(
            child: GestureDetector(
              onTap: () {
                tabController.animateTo(1); // Switch to the second tab
              },
              child: Obx(() {
                bool isSelected = tabController.index == 1;
                return Container(
                  height: 42.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Active Ads",
                    style: lemonMilk500(
                      12.sp,
                      isSelected ? AppColor.white : AppColor.grey,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../const/svg_img.dart';
import '../const/text_style.dart';
import '../view/ads/my_ads.dart';
import '../view/ads/post_add.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  CustomBottomAppBar({required this.currentIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': AppSvgs.home, // unselected icon
        'selectedIcon': AppSvgs.home2, // selected icon
        'label': 'HOME'
      },
      {
        'icon': AppSvgs.ads,
        'selectedIcon': AppSvgs.file,
        'label': 'MY ADS'
      },
      {'icon': '', 'selectedIcon': '', 'label': ''}, // Space for the FAB
      {
        'icon': AppSvgs.heart,
        'selectedIcon': AppSvgs.heart2,
        'label': 'FAVORITES'
      },
      {
        'icon': AppSvgs.profile,
        'selectedIcon': AppSvgs.profile2,
        'label': 'ACCOUNT'
      },
    ];

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.h,
      color: AppColor.green,
      child: Container(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            if (item['icon']!.isEmpty) {
              return SizedBox(width: 48.w); // Space for the FloatingActionButton
            }
            int index = items.indexOf(item);
            return _buildBottomNavigationItem(
              context: context,
              iconPath: item['icon']!,
              selectedIconPath: item['selectedIcon']!,
              label: item['label']!,
              isSelected: currentIndex == index,
              onTap: () => onItemSelected(index),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem({
    required BuildContext context,
    required String iconPath,
    required String selectedIconPath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isSelected ? selectedIconPath : iconPath, // Switch icon based on selection
            width: 20.w,
            height: 20.w,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: lemonMilk400(
                isSelected ? AppColor.orange : AppColor.white, 10.sp),
          ),
        ],
      ),
    );
  }
}

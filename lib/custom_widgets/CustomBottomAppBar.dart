import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../view/home/ads/my_ads.dart';


class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;

  CustomBottomAppBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': 'assets/icons/home.svg', 'label': 'HOME', 'page': MyAdsPage()},
      {'icon': 'assets/icons/ads.svg', 'label': 'MY ADS', 'page': MyAdsPage()},
      {'icon': '', 'label': ''}, // Space for the FAB
      {'icon': 'assets/icons/favorites.svg', 'label': 'FAVORITES', 'page': MyAdsPage()},
      {'icon': 'assets/icons/account.svg', 'label': 'ACCOUNT', 'page': MyAdsPage()},
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
            return _buildBottomNavigationItem(
              context: context,
              iconPath: item['icon']!,
              label: item['label']!,
              page: item['page'],
              isSelected: currentIndex == items.indexOf(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem({
    required BuildContext context,
    required String iconPath,
    required String label,
    required Widget page,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? AppColor.orange : AppColor.white,
            width: 24.w,
            height: 24.w,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColor.orange : AppColor.white,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

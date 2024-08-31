import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class FilterResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'FILTER RESULT',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              // Handle clear filter action
            },
            child: Text(
              'CLEAR FILTER',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.grid_view, color: Colors.green, size: 28.sp),
            onPressed: () {
              // Handle grid view action
            },
          ),
          IconButton(
            icon: Icon(Icons.view_list, color: Colors.grey, size: 28.sp),
            onPressed: () {
              // Handle list view action
            },
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            FilterChipWidget(label: 'GADGETS'),
            FilterChipWidget(
              label: 'LOS ANGELES',
              icon: Icons.location_on,
              iconColor: Colors.orange,
            ),
            FilterChipWidget(label: '\$300- \$800'),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? iconColor;

  FilterChipWidget({required this.label, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
              size: 16.sp,
            ),
          if (icon != null) SizedBox(width: 5.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

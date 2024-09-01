import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';
import '../../../const/images.dart';
import '../../../const/text_style.dart';

class GadgetsScreen extends StatefulWidget {
  const GadgetsScreen({super.key});

  @override
  _GadgetsScreenState createState() => _GadgetsScreenState();
}

class _GadgetsScreenState extends State<GadgetsScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'image': AppImages.comp,
      'title': 'Gadgets',
      'adsCount': '100 ADS',
    },
    {
      'image': AppImages.mob,
      'title': 'ELECTRONICS',
      'adsCount': '22 ADS',
    },
    {
      'image': AppImages.camh,
      'title': 'FURNITURE',
      'adsCount': '150 ADS',
    },
    {
      'image': AppImages.drownh,
      'title': 'ANIMALS',
      'adsCount': '100 ADS',
    },
    {
      'image': AppImages.recth,
      'title': 'FASHION',
      'adsCount': '1K ADS',
    },


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Gadgets',
              style: lemonMilk500(18.sp, AppColor.black),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.r),
                        child: Image.asset(
                          category['image'],
                          width: 50.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category['title'],
                              style: lemonMilk400(AppColor.black, 14.sp),
                            ),
                            Text(
                              category['adsCount'],
                              style: lemonMilk400(AppColor.grey, 12.sp),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.orange,
                        size: 16.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

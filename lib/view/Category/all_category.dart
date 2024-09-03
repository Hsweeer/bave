import 'package:bon_achat/view/Category/syb_categry/gadgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';
import '../../../const/images.dart';
import '../../../const/text_style.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'image': AppImages.ios,
      'title': 'Gadgets',
      'adsCount': '(100 ADS)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.electronics,
      'title': 'ELECTRONICS',
      'adsCount': '(22 ads)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.furniture,
      'title': 'FURNITURE',
      'adsCount': '(150 ads)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.dog,
      'title': 'ANIMALS',
      'adsCount': '(100 ADS)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.fashion,
      'title': 'FASHION',
      'adsCount': '(1k ads)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.bike,
      'title': 'MOTORBIKES',
      'adsCount': '(1k ADS)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.property,
      'title': 'PROPERTY',
      'adsCount': '(200 ads)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.car,
      'title': 'AUTOMOBILES',
      'adsCount': '(150 ADS)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.hosptality,
      'title': 'HOSPITALITY',
      'adsCount': '(1k ADS)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.agri,
      'title': 'AGRICULTURE',
      'adsCount': '(100 ADS)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.buis,
      'title': 'BUSINESS',
      'adsCount': '(22 ads)',
      'page': () => GadgetsScreen(),  // Updated
    },
    {
      'image': AppImages.edu,
      'title': 'EDUCATION',
      'adsCount': '(100 ADS)',
      'page': () => GadgetsScreen(),  // Updated
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
              'ALL CATEGORIES',
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
          return InkWell(
            onTap: () {
              Get.to(category['page']); // Navigating to the desired page
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.r),
                          child: Image.asset(
                            category['image'],
                            width: 45.w,
                            height: 55.h,
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
                                style: lemonMilk400(AppColor.black, 12.sp),
                              ),
                              Text(
                                category['adsCount'],
                                style: lemonMilk400(AppColor.grey, 9.sp),
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
            ),
          );
        },
      ),
    );
  }
}

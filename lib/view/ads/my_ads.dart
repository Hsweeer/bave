import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/colors.dart'; // Make sure this import is correct
import '../../const/images.dart'; // Make sure this import is correct
import '../../const/text_style.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../../controllers/home_scr_controllers/view_controller.dart';
import 'Activeadds.dart';
import 'ad_details.dart';

class Ad {
  final String category;
  final String title;
  final String price;
  final String location;
  final String timeAgo;
  final String imagePath;
  final String id;

  Ad({
    required this.category,
    required this.title,
    required this.price,
    required this.location,
    required this.timeAgo,
    required this.imagePath,
    required this.id,
  });
}

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final ViewController viewController = Get.put(ViewController());

  final FavoriteController favoriteController = Get.put(FavoriteController());

  bool isGridViewSelected = true;

  final List<Map<String, String>> recentAds = [
    {
      'id': '1', // Added unique ID for favorite tracking
      'category': 'GADGET / MOBILE',
      'title': 'APPLE IPHONE 15 PRO MAX NATURAL...',
      'price': '\$1000',
      'image': AppImages.ios2,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '2',
      'category': 'AUTOMOBILES /  CAR',
      'title': 'LOREM IPSUM DOLOR SIT AMET ...',
      'price': '\$3300',
      'image': AppImages.bmw,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '3',
      'category': 'ANIMAL / CAT',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$390',
      'image': AppImages.cat,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '4',
      'category': 'FASHION / SHOE',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.shoe,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '5',
      'category': 'Popular / House',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.house,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '6',
      'category': 'Electronics / Television',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.televison,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '7',
      'category': 'Gadget / Headphone',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.hedset,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'id': '8',
      'category': 'Automobile / Cycle',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.bicycle,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    // Add more ads here
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "MY ", style: lemonMilk500(24.sp, AppColor.black)),
                    TextSpan(text: "ADS", style: lemonMilk500(24.sp, AppColor.green)),
                  ],
                ),
              ),
            ),
            Obx(() {
              bool isGridView = viewController.isGridView.value;
              return Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.grid_view,
                      color: isGridView ? AppColor.green : AppColor.black,
                    ),
                    onPressed: () {
                      viewController.toggleViewMode();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.view_list,
                      color: !isGridView ? AppColor.green : AppColor.black,
                    ),
                    onPressed: () {
                      viewController.toggleViewMode();
                    },
                  ),
                ],
              );
            }),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(58.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Container(
                  height: 55.h,
                  width: 170.w,
                  child: Tab(
                    text: "Pending Ads",
                  ),
                ),
                Container(
                  height: 55.h,
                  width: 170.w,
                  child: Tab(
                    text: "Active Ads",
                  ),
                ),
              ],
              labelColor: AppColor.white,
              unselectedLabelColor: AppColor.grey,
              indicator: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(8.r),
              ),
              indicatorPadding: EdgeInsets.symmetric(vertical: 6.h),
              labelStyle: lemonMilk500(12.sp, AppColor.white),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAdsList(),
          Activeadds(),
        ],
      ),
    );
  }

  Widget _buildAdsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Obx(() {
        bool isGridView = viewController.isGridView.value;
        return isGridView
            ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.70,
          ),
          padding: EdgeInsets.zero,
          itemCount: recentAds.length,
          itemBuilder: (context, index) {
            final ad = recentAds[index];
            return _buildAdCard(ad);
          },
        )
            : ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: recentAds.length,
          itemBuilder: (context, index) {
            final ad = recentAds[index];
            return _buildAdCard(ad);
          },
        );
      }),
    );
  }

  Widget _buildAdCard(Map<String, String> ad) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdDetailsPage(
              imagePath: ad['image']!,
              location: ad['location']!,
              title: ad['title']!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              child: Image.asset(
                ad['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.tag, height: 10.h, width: 10.w),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              ad['category']!,
                              style: lemonMilk400(AppColor.orange, 8.sp),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          favoriteController.toggleFavorite(ad['id']!);
                        },
                        child: Icon(
                          favoriteController.isFavorite(ad['id']!)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 16.h,
                          color: favoriteController.isFavorite(ad['id']!)
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ],
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
                  SizedBox(height: 4.h),
                  Text(
                    ad['title']!,
                    style: lemonMilk500(10.sp, AppColor.black),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    ad['price']!,
                    style: lemonMilk400(AppColor.orange, 10.sp),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Image.asset(AppImages.location, height: 10.h),
                          ),
                          Text(
                            ad['location']!,
                            style: lemonMilk400(AppColor.grey, 7.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Image.asset(AppImages.clock, height: 10.h),
                          ),
                          Text(
                            ad['time']!,
                            style: lemonMilk400(AppColor.grey, 7.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

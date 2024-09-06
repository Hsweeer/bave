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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Initialize with appropriate length
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
 body: Column(
    children: [
    // Moved AppBar components here
    Container(
    color: AppColor.white,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "MY ",
                          style: lemonMilk500(24.sp, AppColor.black),
                        ),
                        TextSpan(
                          text: "ADS",
                          style: lemonMilk500(24.sp, AppColor.green),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                      () {
                    bool isGridView = viewController.isGridView.value;
                    return
                      Row(
                        children: [

                          SizedBox(
                            width: 18.w,
                            child: IconButton(
                              icon: Icon(
                                Icons.grid_view_sharp,
                                color: isGridView ? AppColor.green : AppColor.black,
                                size: 18.h,
                              ),
                              onPressed: () {
                                viewController.toggleViewMode(); // Toggle view mode
                              },
                            ),
                          ),
                          SizedBox(width: 4.w,),

                          SizedBox(
                            width:30.w
                            ,                          child: IconButton(
                            icon: Icon(
                              Icons.view_list,
                              color: !isGridView ? AppColor.green : AppColor.black,
                            ),
                            onPressed: () {
                              viewController.toggleViewMode(); // Toggle view mode
                            },
                          ),
                          ),
                          SizedBox(width: 12.w,),
                        ],
                      );
                  },
                ),
              ],
            ),
          ),
      Container(
        padding: EdgeInsets.only(right: 16.w),
        child: AnimatedBuilder(
          animation: _tabController!,
          builder: (context, _) {
            return TabBar(
              controller: _tabController,
              tabs: [
                Container(
                  height: 42.h,
                  width: 170.w,
                  decoration: BoxDecoration(
                    color: _tabController?.index == 0 ? AppColor.green : AppColor.greyll, // Set color based on selection
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      "Pending Ads",
                      style: lemonMilk500(
                        12.sp,
                        _tabController?.index == 0 ? AppColor.white : Colors.black, // Text color based on selection
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42.h,
                  width: 170.w,
                  decoration: BoxDecoration(
                    color: _tabController?.index == 1 ? AppColor.green : AppColor.greyll, // Set color based on selection
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      "Active Ads",
                      style: lemonMilk500(
                        12.sp,
                        _tabController?.index == 1 ? AppColor.white : Colors.black, // Text color based on selection
                      ),
                    ),
                  ),
                ),
              ],
              labelColor: AppColor.white,
              unselectedLabelColor: AppColor.black, // Set the unselected label color to black
              indicator: BoxDecoration(
                color: Colors.transparent, // Indicator is transparent to avoid overlapping colors
                borderRadius: BorderRadius.circular(8.r),
              ),
              indicatorPadding: EdgeInsets.symmetric(vertical: 6.h),
            );
          },
        ),
      ),
        ],
      ),
    ),
    Expanded(
    child: TabBarView(
    controller: _tabController,
    children: [
    _buildAdsList(),
    Activeadds(),
    ],
    ),
    ),
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
            childAspectRatio: 0.73,
          ),
          padding: EdgeInsets.zero,
          itemCount: recentAds.length,
          itemBuilder: (context, index) {
            final ad = recentAds[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdDetailsPage(
                        imagePath: ad['image']!,
                        location: ad['location']!,
                        title: ad['title']!
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
                                      style: lemonMilk400(AppColor.orange, 6.sp),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  favoriteController.toggleFavorite(ad['id']!);
                                },
                                child: Icon(
                                  favoriteController.isFavorite(ad['id']!) ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: 10.h,
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
                            style: lemonMilk400(AppColor.orange, 8.sp),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Image.asset(AppImages.location, height: 7.h),
                                  ),
                                  Text(
                                    ad['location']!,
                                    style: lemonMilk400(AppColor.grey, 5.5.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: Image.asset(AppImages.clock, height: 7.h),
                                  ),
                                  Text(
                                    ad['time']!,
                                    style: lemonMilk400(AppColor.grey, 5.5.sp),
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
          },
        )
            : ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: recentAds.length,
          itemBuilder: (context, index) {
            final ad = recentAds[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdDetailsPage(imagePath: ad['image']!,
                        location: ad['location']!,
                        title: ad['title']!),
                  ),
                );
              },
              child: Container(
                height: 106.h,
                decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(width: 1.w,color:AppColor.black3,)
                ),
                margin: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        // borderRadius: BorderRadius.horizontal(left: Radius.circular(8.r),right: Radius.circular(8.r),b),
                        child: Image.asset(
                          ad['image']!,
                          fit: BoxFit.cover,
                          width: 120.w,
                          height: 95.h,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.tag, height: 10.h, width: 10.w),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    ad['category']!,
                                    style: lemonMilk400(AppColor.orange, 7.sp),
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
                            SizedBox(height: 6.h),
                            Text(
                              ad['title']!,
                              style: lemonMilk500( 10.sp,AppColor.black,),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2.0),
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
                            SizedBox(height: 6.h),

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
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  ad['price']!,
                                  style: lemonMilk400(AppColor.orange, 11.sp),
                                ),
                                Icon(Icons.favorite_outline,size: 14.sp,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
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

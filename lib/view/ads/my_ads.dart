import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/colors.dart'; // Make sure this import is correct
import '../../const/images.dart'; // Make sure this import is correct
import '../../const/text_style.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
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
  final FavoriteController favoriteController = Get.put(FavoriteController());


  List<Ad> ads = [
    Ad(
      id: '1', // Added unique ID for favorite tracking

      category: "GADGET / LAPTOP",
      title: "Apple MacBook Pro with M1 ...",
      price: "\$800",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.mac,
    ),
    Ad(
      id: '2', // Added unique ID for favorite tracking

      category: "GADGET / COMPUTER",
      title: "Lorem Ipsum Dolor Sit Amet ...",
      price: "\$400",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.lap_tab,
    ),
    Ad(
      id: '3', // Added unique ID for favorite tracking

      category: "GADGET / MOBILE",
      title: "Apple iPhone 15 Pro Max Natural...",
      price: "\$1000",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.iphone,
    ),
    Ad(
      id: '4', // Added unique ID for favorite tracking

      category: "GADGET / HEADPHONES",
      title: "Lorem Ipsum Dolor Sit  ...",
      price: "\$200",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.headphone,
    ),
    Ad(
      id: '5', // Added unique ID for favorite tracking

      category: "GADGET / CAMERA",
      title: "Sony A7 III Camera ...",
      price: "\$1200",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.camera,
    ),
    Ad(
      id: '5', // Added unique ID for favorite tracking

      category: "GADGET / MOBILE",
      title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
      price: "\$500",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.mobile,
    ),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "MY ",
                      style: lemonMilk500(25.sp,AppColor.black)
                    ),
                    TextSpan(
                      text: "ADS",
                        style: lemonMilk500(25.sp,AppColor.green)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Container(
                  height: 42.h, // Set your desired height
                  width: 171.w, // Set your desired width
                  child: Tab(text: "Pending Ads",),
                ),
                Container(
                  height: 42.h, // Set your desired height
                  width: 171.w, // Set your desired width
                  child: Tab(text: "Active Ads"),
                ),
              ],
              labelColor: AppColor.white,
              unselectedLabelColor: AppColor.grey,
              indicator: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(8.r),
              ),
              // Optional: adjust or remove this based on your tab sizes
              indicatorPadding: EdgeInsets.symmetric(vertical: 6.h),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAdsList(), // Pending Ads
          _buildAdsList(), // Active Ads (reuse the same list for simplicity)
        ],
      ),
    );
  }

//   Widget _buildAdsList() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//       child: GridView.builder(
//         gridDelegate:
//         SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.w,
//           mainAxisSpacing: 10.h,
//           childAspectRatio: 0.70,
//         ),
//         padding: EdgeInsets.zero, // Ensure there’s no extra padding
//
//         itemCount: ads.length,
//         itemBuilder: (context, index) {
//           final ad = ads[index];
//           return GestureDetector(
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AdDetailsPage(
//                     imagePath:ad.imagePath,
//                     title: ad.title,
//                     location: ad.location,
//
//
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               height: 177.h,
//               decoration: BoxDecoration(
//                 color: AppColor.lightgrey,
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(8.r)),
//                     child: Image.asset(
//                       ad.imagePath,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       // height: 140.h,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.center,
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               crossAxisAlignment:
//                               CrossAxisAlignment.center,
//                               children: [
//                                 Image.asset(AppImages.tag,
//                                     height: 10.h, width: 10.w),
//                                 Padding(
//                                   padding:
//                                   const EdgeInsets.only(
//                                       left: 4.0),
//                                   child: Text(
//                                     ad.category,
//                                     style: lemonMilk400(
//                                         AppColor.orange, 8.sp),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 favoriteController
//                                     .toggleFavorite(ad.id);
//                               },
//                               child: Icon(
//                                 favoriteController
//                                     .isFavorite(ad.id)
//                                     ? Icons.favorite
//                                     : Icons.favorite_outline,
//                                 size: 16.h,
//                                 color: favoriteController
//                                     .isFavorite(ad.id)
//                                     ? Colors.red
//                                     : Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 4),
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Color.fromRGBO(
//                                     0, 0, 0, 0.08),
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
//                           ad.title,
//                           style: lemonMilk500(
//                               11.sp, AppColor.black),
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
// ad.price,                          style: lemonMilk400(
//                               AppColor.orange, 10.sp),
//                         ),
//                         SizedBox(height: 4.h),
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding:
//                                   const EdgeInsets.only(
//                                       right: 4.0),
//                                   child: Image.asset(
//                                       AppImages.location,
//                                       height: 10.h),
//                                 ),
//                                 Text(
// ad.location,
//                                   style: lemonMilk400(
//                                       AppColor.grey, 8.sp),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding:
//                                   const EdgeInsets.only(
//                                       right: 4.0),
//                                   child: Image.asset(
//                                       AppImages.clock,
//                                       height: 10.h),
//                                 ),
//                                 Text(
// ad.timeAgo,                                  style: lemonMilk400(
//                                       AppColor.grey, 8.sp),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
  Widget _buildAdsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.70,
        ),
        padding: EdgeInsets.zero, // Ensure there’s no extra padding
        itemCount: ads.length,
        itemBuilder: (context, index) {
          final ad = ads[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdDetailsPage(
                    imagePath: ad.imagePath,
                    title: ad.title,
                    location: ad.location,
                  ),
                ),
              );
            },
            child: Container(
              height: 177.h,
              decoration: BoxDecoration(
                color: AppColor.lightgrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
                    child: Image.asset(
                      ad.imagePath,
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
                                SizedBox(width: 4.w),
                                Text(
                                  ad.category,
                                  style: lemonMilk400(AppColor.orange, 8.sp),
                                  overflow: TextOverflow.ellipsis, // Prevent overflow
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                favoriteController.toggleFavorite(ad.id);
                              },
                              child: Icon(
                                favoriteController.isFavorite(ad.id)
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                size: 16.h,
                                color: favoriteController.isFavorite(ad.id)
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
                          ad.title,
                          style: lemonMilk500(11.sp, AppColor.black),
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          ad.price,
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
                                  ad.location,
                                  style: lemonMilk400(AppColor.grey, 7.sp),
                                  overflow: TextOverflow.ellipsis, // Prevent overflow
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
                                  ad.timeAgo,
                                  style: lemonMilk400(AppColor.grey, 7.sp),
                                  overflow: TextOverflow.ellipsis, // Prevent overflow
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
      ),
    );
  }


}

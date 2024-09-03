// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../const/colors.dart'; // Make sure this import is correct
// import '../../const/images.dart'; // Make sure this import is correct
// import '../../const/text_style.dart';
// import '../../controllers/home_scr_controllers/favourate.dart';
// import '../ads/ad_details.dart';
//
// class Ad {
//   final String category;
//   final String title;
//   final String price;
//   final String location;
//   final String timeAgo;
//   final String imagePath;
//   final String id;
//
//   Ad({
//     required this.category,
//     required this.title,
//     required this.price,
//     required this.location,
//     required this.timeAgo,
//     required this.imagePath,
//     required this.id,
//   });
// }
//
// class Favourite extends StatefulWidget {
//   @override
//   _FavouriteState createState() => _FavouriteState();
// }
//
// class _FavouriteState extends State<Favourite> with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   bool isGridViewSelected = true;
//
//   final FavoriteController favoriteController = Get.put(FavoriteController());
//
//
//   List<Ad> ads = [
//     Ad(
//       id: '1', // Added unique ID for favorite tracking
//
//       category: "GADGET / LAPTOP",
//       title: "Apple MacBook Pro with M1 Chip...",
//       price: "\$800",
//       location: "Uttara, Dhaka",
//       timeAgo: "30 mins ago",
//       imagePath: AppImages.mac,
//     ),
//     Ad(
//       id: '2', // Added unique ID for favorite tracking
//
//       category: "GADGET / COMPUTER",
//       title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
//       price: "\$400",
//       location: "Uttara, Dhaka",
//       timeAgo: "30 mins ago",
//       imagePath: AppImages.lap_tab,
//     ),
//     Ad(
//       id: '3', // Added unique ID for favorite tracking
//
//       category: "GADGET / MOBILE",
//       title: "Apple iPhone 15 Pro Max Natural Titanium...",
//       price: "\$1000",
//       location: "Uttara, Dhaka",
//       timeAgo: "30 mins ago",
//       imagePath: AppImages.iphone,
//     ),
//     Ad(
//       id: '4', // Added unique ID for favorite tracking
//
//       category: "GADGET / HEADPHONES",
//       title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
//       price: "\$200",
//       location: "Uttara, Dhaka",
//       timeAgo: "30 mins ago",
//       imagePath: AppImages.headphone,
//     ),
//     Ad(
//       id: '5', // Added unique ID for favorite tracking
//
//       category: "GADGET / CAMERA",
//       title: "Sony A7 III Camera with Lens...",
//       price: "\$1200",
//       location: "Uttara, Dhaka",
//       timeAgo: "30 mins ago",
//       imagePath: AppImages.camera,
//     ),
//     Ad(
//       id: '5', // Added unique ID for favorite tracking
//
//       category: "GADGET / MOBILE",
//       title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
//       price: "\$500",
//       location: "Uttara, Dhaka",
//       timeAgo: "30 mins ago",
//       imagePath: AppImages.mobile,
//     ),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       appBar: AppBar(
//         backgroundColor: AppColor.white,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 16.0), // Use standard padding
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "FAVORITES",
//                       style: TextStyle(
//                         color: AppColor.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24.0, // Use a standard font size
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Spacer(),
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     Icons.grid_view,
//                     color: isGridViewSelected ? AppColor.green : AppColor.black,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isGridViewSelected = true;
//                     });
//                     // Handle the first button action (Grid View)
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.view_list,
//                     color: !isGridViewSelected ? AppColor.green : AppColor.black,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isGridViewSelected = false;
//                     });
//                     // Handle the second button action (List View)
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildAdsList(), // Pending Ads
//           _buildAdsList(), // Active Ads (reuse the same list for simplicity)
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAdsList() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//       child: GridView.builder(
//         gridDelegate:
//         SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.w,
//           mainAxisSpacing: 10.h,
//           childAspectRatio: 0.65,
//
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
//                   builder: (context) => AdDetailsPage(imagePath:                        ad.imagePath,
//
//                   ),
//                 ),
//               );
//             },
//             child: Container(
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
//                                 Icons.favorite,
//                                 color: AppColor.red,
//
//
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
//                           ad.price,                          style: lemonMilk400(
//                             AppColor.orange, 10.sp),
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
//                                   ad.location,
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
//                                   ad.timeAgo,                                  style: lemonMilk400(
//                                     AppColor.grey, 8.sp),
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
//
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/colors.dart'; // Ensure these imports are correct
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../../controllers/home_scr_controllers/view_controller.dart';
import '../ads/ad_details.dart';

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

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> with SingleTickerProviderStateMixin {
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
              padding: EdgeInsets.only(left: 0.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "FAVORITES",
                      style: lemonMilk500( 24.sp,AppColor.black,),

                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Obx(
                  () {
                bool isGridView = viewController.isGridView.value;
                return Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.grid_view,
                        color: isGridView ? AppColor.green : AppColor.black,
                      ),
                      onPressed: () {
                        viewController.toggleViewMode(); // Toggle view mode
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.view_list,
                        color: !isGridView ? AppColor.green : AppColor.black,
                      ),
                      onPressed: () {
                        viewController.toggleViewMode(); // Toggle view mode
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                    () {
                  bool isGridView = viewController.isGridView.value; // Correctly observe the view mode
                  return Expanded(
                    child: isGridView
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
                                              Icons.favorite, // Always shows the filled heart icon
                                              size: 16.h,
                                              color: Colors.red, // Always set the color to red
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
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(8.r)),
                                  child: Image.asset(
                                    ad['image']!,
                                    fit: BoxFit.cover,
                                    width: 140.w,
                                    height: 120.h,
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
                                                style: lemonMilk400(AppColor.orange, 9.sp),
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
                                          style: lemonMilk600(AppColor.black, 10.sp),
                                        ),
                                        SizedBox(height: 4.h),
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              ad['price']!,
                                              style: lemonMilk600(AppColor.orange, 11.sp),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                favoriteController.toggleFavorite(ad['id']!);
                                              },
                                              child: Icon(
                                                Icons.favorite, // Always shows the filled heart icon
                                                size: 16.h,
                                                color: Colors.red, // Always set the color to red
                                              ),
                                            ),                                          ],
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
                    ),
                  );
                },
              )

            ],
          ),
        )
    );
  }


}

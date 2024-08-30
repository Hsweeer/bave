import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/colors.dart'; // Make sure this import is correct
import '../../const/images.dart'; // Make sure this import is correct
import '../../const/text_style.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
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
  bool isGridViewSelected = true;

  final FavoriteController favoriteController = Get.put(FavoriteController());


  List<Ad> ads = [
    Ad(
      id: '1', // Added unique ID for favorite tracking

      category: "GADGET / LAPTOP",
      title: "Apple MacBook Pro with M1 Chip...",
      price: "\$800",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.mac,
    ),
    Ad(
      id: '2', // Added unique ID for favorite tracking

      category: "GADGET / COMPUTER",
      title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
      price: "\$400",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.lap_tab,
    ),
    Ad(
      id: '3', // Added unique ID for favorite tracking

      category: "GADGET / MOBILE",
      title: "Apple iPhone 15 Pro Max Natural Titanium...",
      price: "\$1000",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.iphone,
    ),
    Ad(
      id: '4', // Added unique ID for favorite tracking

      category: "GADGET / HEADPHONES",
      title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
      price: "\$200",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.headphone,
    ),
    Ad(
      id: '5', // Added unique ID for favorite tracking

      category: "GADGET / CAMERA",
      title: "Sony A7 III Camera with Lens...",
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
              padding: EdgeInsets.only(left: 16.0), // Use standard padding
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "FAVORITES",
                      style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0, // Use a standard font size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.grid_view,
                    color: isGridViewSelected ? AppColor.green : AppColor.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isGridViewSelected = true;
                    });
                    // Handle the first button action (Grid View)
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.view_list,
                    color: !isGridViewSelected ? AppColor.green : AppColor.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isGridViewSelected = false;
                    });
                    // Handle the second button action (List View)
                  },
                ),
              ],
            ),
          ],
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

  Widget _buildAdsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.65,

        ),
        padding: EdgeInsets.zero, // Ensure there’s no extra padding

        itemCount: ads.length,
        itemBuilder: (context, index) {
          final ad = ads[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdDetailsPage(imagePath:                        ad.imagePath,

                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.lightgrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8.r)),
                    child: Image.asset(
                      ad.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // height: 140.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.tag,
                                    height: 10.h, width: 10.w),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 4.0),
                                  child: Text(
                                    ad.category,
                                    style: lemonMilk400(
                                        AppColor.orange, 8.sp),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                favoriteController
                                    .toggleFavorite(ad.id);
                              },
                              child: Icon(
                                Icons.favorite,
                                color: AppColor.red,


                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.08),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          ad.title,
                          style: lemonMilk500(
                              11.sp, AppColor.black),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          ad.price,                          style: lemonMilk400(
                            AppColor.orange, 10.sp),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      right: 4.0),
                                  child: Image.asset(
                                      AppImages.location,
                                      height: 10.h),
                                ),
                                Text(
                                  ad.location,
                                  style: lemonMilk400(
                                      AppColor.grey, 8.sp),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      right: 4.0),
                                  child: Image.asset(
                                      AppImages.clock,
                                      height: 10.h),
                                ),
                                Text(
                                  ad.timeAgo,                                  style: lemonMilk400(
                                    AppColor.grey, 8.sp),
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

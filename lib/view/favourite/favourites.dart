import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/colors.dart'; // Make sure this import is correct
import '../../const/images.dart'; // Make sure this import is correct
import '../ads/ad_details.dart';

class Ad {
  final String category;
  final String title;
  final String price;
  final String location;
  final String timeAgo;
  final String imagePath;

  Ad({
    required this.category,
    required this.title,
    required this.price,
    required this.location,
    required this.timeAgo,
    required this.imagePath,
  });
}

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isGridViewSelected = true;

  List<Ad> ads = [
    Ad(
      category: "GADGET / LAPTOP",
      title: "Apple MacBook Pro with M1 Chip...",
      price: "\$800",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.mac,
    ),
    Ad(
      category: "GADGET / COMPUTER",
      title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
      price: "\$400",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.lap_tab,
    ),
    Ad(
      category: "GADGET / MOBILE",
      title: "Apple iPhone 15 Pro Max Natural Titanium...",
      price: "\$1000",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.iphone,
    ),
    Ad(
      category: "GADGET / HEADPHONES",
      title: "Lorem Ipsum Dolor Sit Amet Consectetur...",
      price: "\$200",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.headphone,
    ),
    Ad(
      category: "GADGET / CAMERA",
      title: "Sony A7 III Camera with Lens...",
      price: "\$1200",
      location: "Uttara, Dhaka",
      timeAgo: "30 mins ago",
      imagePath: AppImages.camera,
    ),
    Ad(
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.777, // Updated aspect ratio
        ),
        itemBuilder: (context, index) {
          final ad = ads[index];
          return _buildAdCard(ad);
        },
        itemCount: ads.length,
      ),
    );
  }

  Widget _buildAdCard(Ad ad) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdDetailsPage(imagePath: ad.imagePath),
          ),
        );
      },
      child: Card(
        color: AppColor.lightgrey,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                child: Image.asset(
                  ad.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ad.category,
                    style: TextStyle(
                      color: AppColor.orange,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          ad.title,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: AppColor.red,
                        onPressed: () {
                          // Handle heart icon press
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    ad.price,
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 10.sp,
                        color: AppColor.grey,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        ad.location,
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 10.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        ad.timeAgo,
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 10.sp,
                        ),
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

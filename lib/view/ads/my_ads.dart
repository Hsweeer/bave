// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../const/colors.dart';
// import '../../../const/text_style.dart';
// import '../../../custom_widgets/CustomBottomAppBar.dart';
// import '../../const/svg_img.dart';
//
//
// class MyAdsPage extends StatefulWidget {
//   @override
//   _MyAdsPageState createState() => _MyAdsPageState();
// }
//
// class _MyAdsPageState extends State<MyAdsPage> with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//
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
//
//       appBar: AppBar(
//         backgroundColor: AppColor.white,
//         elevation: 0,
//         title: Padding(
//           padding: EdgeInsets.only(left: 16.w),
//           child: RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "MY ",
//                   style: TextStyle(
//                     color: AppColor.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24.sp,
//                   ),
//                 ),
//                 TextSpan(
//                   text: "ADS",
//                   style: TextStyle(
//                     color: AppColor.green,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(48.h),
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: TabBar(
//               controller: _tabController,
//               tabs: [
//                 Tab(text: "Pending Ads"),
//                 Tab(text: "Active Ads"),
//               ],
//               labelColor: AppColor.white,
//               unselectedLabelColor: AppColor.black2,
//               indicator: BoxDecoration(
//                 color: AppColor.green,
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               indicatorPadding: EdgeInsets.symmetric(vertical: 8.h),
//               labelStyle: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           Center(child:
//           // Text(
//           //   "You have no pending ads.",
//           //   style: lemonMilk500(15.sp,AppColor.green),
//           // )
//           _buildNoActiveAdsContent(),
//
//           ),
//         ],
//       ),
//      // Index of 'MY ADS' page
//     );
//   }
//
//   Widget _buildNoActiveAdsContent() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(
//           AppSvgs.file,
//           color: AppColor.orange,
//           width: 57.w,
//           height: 57.h,
//         ),
//         SizedBox(height: 20.h),
//         Text(
//           "YOU HAVE NO ACTIVE ADS",
//           style: lemonMilk500(15.sp,AppColor.green),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "MY ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
                TextSpan(
                  text: "ADS",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Pending Ads"),
                Tab(text: "Active Ads"),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8.r),
              ),
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
          _buildAdsList(),
          _buildAdsList(), // Add the same widget for Active Ads for now.
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
          childAspectRatio: 0.75, // Adjust the aspect ratio as per your design.
        ),
        itemBuilder: (context, index) {
          return _buildAdCard();
        },
        itemCount: 6, // Set the number of ads.
      ),
    );
  }

  Widget _buildAdCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              child: Image.asset(
                'assets/images/sample_ad_image.png', // Replace with your image asset.
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          // Text section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GADGET / LAPTOP", // Replace with dynamic category.
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Apple MacBook Pro with M1 Chip...", // Replace with dynamic title.
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  "\$800", // Replace with dynamic price.
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 12.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Uttara, Dhaka...", // Replace with dynamic location.
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "30 mins ago", // Replace with dynamic time.
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

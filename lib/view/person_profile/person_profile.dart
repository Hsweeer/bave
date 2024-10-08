import 'package:bon_achat/const/images.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../const/colors.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../../controllers/home_scr_controllers/view_controller.dart';
import '../ads/ad_details.dart';
import '../home/product_details.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      'title': 'Lorem ipsum dolor sit amet consectetur. ...',
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
  final ViewController viewController = Get.put(ViewController());

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50.h,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.black),
          onPressed: () {
            // Handle back action.
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Using ScreenUtil for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Circle with orange border
                Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange, // Orange border color
                      width: 2.w,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 27.r, // Adjusted for padding inside the border
                    backgroundImage: AssetImage(AppImages.profile), // Replace with your image asset
                  ),
                ),
                SizedBox(width: 16.w), // Responsive space using ScreenUtil
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'JACKON HONSON',
                      style: lemonMilk500(15.sp, Color.fromRGBO(35, 45, 59, 1))
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Joined: February 02, 2021',
                      style: lemonMilk400(Color.fromRGBO(119, 119, 119, 1), 10.sp)
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Corporis dolore libero temporibus minus',
              style:lemonMilk400(Color.fromRGBO(85, 85, 85, 1), 11.sp)
            ),  Text(
              'tempora quia voluptas nesciunt.',
              style:lemonMilk400(Color.fromRGBO(85, 85, 85, 1), 11.sp)
            ),
            SizedBox(height: 16.h),
            Divider(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL ADS',
                  style: lemonMilk500(14.sp, Color.fromRGBO(35, 45, 59, 1))
                ),
                Text(
                  '134',
                  style: lemonMilk500(15.sp, Color.fromRGBO(85, 85, 85, 1))
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Divider(color: AppColor.black3, // Set the color of the divider
              thickness: 0.5, // Set the thickness of the divider (width)
               ),

            Obx(
                  () {
                bool isGridView = viewController.isGridView.value;
                return
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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

                    ],
                  );
              },
            ),
            SizedBox(height: 0.h,),
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
                              builder: (context) => prDetailsPage(
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
                              builder: (context) => prDetailsPage(imagePath: ad['image']!,
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
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}

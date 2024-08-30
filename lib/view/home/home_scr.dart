import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../ads/ad_details.dart';
import 'Search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initialize the FavoriteController
  final FavoriteController favoriteController = Get.put(FavoriteController());

  bool isGridViewSelected = true;

  final List<Map<String, String>> categories = [
    {'image': AppImages.ios, 'text': 'Gadgets '},
    {'image': AppImages.electronics, 'text': 'Electronics'},
    {'image': AppImages.furniture, 'text': 'Furniture'},
    {'image': AppImages.dog, 'text': 'Animals'},
    {'image': AppImages.fashion, 'text': 'Fashion'},
    {'image': AppImages.bike, 'text': 'Motorbikes'},
    // Add more categories here
  ];

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
      'category': 'AUTOMOBILES / PRIVATE CAR',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
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
      'image': AppImages.bycycle,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    // Add more ads here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage(AppImages.person),
                  backgroundColor: Colors.transparent,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '   Current Location',
                      style: lemonMilk500(9.sp, AppColor.grey),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_sharp,
                            color: AppColor.green, size: 13.h),
                        SizedBox(width: 5.w),
                        Row(
                          children: [
                            Text(
                              'Uttara, Dhaka',
                              style: lemonMilk500(13.sp, AppColor.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Icon(Icons.keyboard_arrow_down_outlined,color: Color.fromRGBO(0, 0, 0, 0.2),size: 18.h,),
                            )
                          ],

                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(AppImages.bellicon, height: 24.h, width: 24.w),
              ],
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                // Replace `NewScreen()` with your actual screen widget.
                Get.to(Search());
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColor.green),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'What are you looking for?',
                        style: lemonMilk400(AppColor.black2, 10.sp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColor.orange,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.Search,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BROWSE BY CATEGORIES',
                  style: lemonMilk500(16.sp, AppColor.black),
                ),
                Text('view all',style: lemonMilk400(AppColor.green, 12.sp),)
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              height: 90.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    width: 60.w,
                    height: 60.h,
                    margin: EdgeInsets.only(right: 10.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(category['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          category['text']!,
                          style: lemonMilk500(10.sp, AppColor.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'RECENT ',
                        style: lemonMilk500(14.sp, AppColor.black),
                      ),
                      TextSpan(
                        text: 'ADS',
                        style: lemonMilk500(14.sp, AppColor.green),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.grid_view,
                        color: isGridViewSelected ? AppColor.green : AppColor.black,
                      ),
                      onPressed: () {

                        setState(() {
                          favoriteController.toggleFavorite('grid');

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
                          favoriteController.toggleFavorite('list');

                          isGridViewSelected = false;

                        });
                        // Handle the second button action (List View)
                      },
                    ),
                  ],
                ),

                // Row(
                //   children: [
                //     IconButton(
                //       icon: Icon(Icons.check_box_outline_blank, size: 20.h),
                //       onPressed: () {
                //         favoriteController.toggleFavorite('grid');
                //       },
                //     ),
                //     IconButton(
                //       icon: Icon(Icons.list, size: 20.h),
                //       onPressed: () {
                //         favoriteController.toggleFavorite('list');
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
            Obx(
              () {
                bool isGridView = favoriteController.isFavorite('grid');
                return Expanded(
                  child: isGridView
                      ?
                  Container(

                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                              childAspectRatio: 0.70,
                            ),
                          padding: EdgeInsets.zero, // Ensure there’s no extra padding

                          itemCount: recentAds.length,
                            itemBuilder: (context, index) {
                              final ad = recentAds[index];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdDetailsPage(imagePath:    ad['image']!,
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
                                          ad['image']!,
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
                                                        ad['category']!,
                                                        style: lemonMilk400(
                                                            AppColor.orange, 8.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    favoriteController
                                                        .toggleFavorite(ad['id']!);
                                                  },
                                                  child: Icon(
                                                    favoriteController
                                                            .isFavorite(ad['id']!)
                                                        ? Icons.favorite
                                                        : Icons.favorite_outline,
                                                    size: 16.h,
                                                    color: favoriteController
                                                            .isFavorite(ad['id']!)
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
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.08),
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              ad['title']!,
                                              style: lemonMilk500(
                                                  11.sp, AppColor.black),
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              ad['price']!,
                                              style: lemonMilk400(
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
                                                      ad['location']!,
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
                                                      ad['time']!,
                                                      style: lemonMilk400(
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
                      )
                      : ListView.builder(
                    padding: EdgeInsets.zero, // Ensure there’s no extra padding

                    itemCount: recentAds.length,
                          itemBuilder: (context, index) {
                            final ad = recentAds[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdDetailsPage(imagePath:    ad['image']!,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.lightgrey,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                margin: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(8.r)),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,

                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(AppImages.tag,height:10.h ,width: 10.w,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 6.0),
                                                  child: Text(
                                                    ad['category']!,
                                                    style: lemonMilk400(
                                                        AppColor.orange, 9.sp),
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
                                              ad['title']!,
                                              style: lemonMilk600(AppColor.black, 12.sp),),
                                            SizedBox(height: 4.h),

                                            SizedBox(height: 0.h),
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
                                                      ad['location']!,
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
                                                      ad['time']!,
                                                      style: lemonMilk400(
                                                          AppColor.grey, 8.sp),
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
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.08),
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 6.h,),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  ad['price']!,
                                                  style: lemonMilk400(
                                                      AppColor.orange, 11.sp),
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
                                            )

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
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bon_achat/view/home/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../../controllers/home_scr_controllers/view_controller.dart';
import '../Category/all_category.dart';
import '../Filter_choice/Filter_screen.dart';
import '../Notification_scr/notifications.dart';
import '../ads/ad_details.dart';
import 'Search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initialize the FavoriteController
  final ViewController viewController = Get.put(ViewController());

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
      'title': 'Apple Iphone 15 Pro Max natural titanium...',
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
                  radius: 20.r,
                  backgroundImage: AssetImage(AppImages.person2),
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
                            color: AppColor.green, size: 18.h),
                        SizedBox(width: 3.w),
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
                GestureDetector(
                  onTap: (){
                    Get.to(NotificationScreen());

                  },
                    child: Image.asset(AppImages.bellIcon, height: 24.h, width: 24.w)),
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
                  border: Border.all(width: 0.5.w, color: AppColor.green),
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
                            AppImages.search,
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
                  style: lemonMilk500(14.sp, AppColor.black),
                ),
                InkWell(
                  onTap: () {
                    // Replace `NewScreen()` with your actual screen widget.
                    Get.to(CategoriesScreen());
                  },
                  child: Text(
                    'view all',
                    style: lemonMilk400(AppColor.green, 11.sp),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              height: 82.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: (){
                      Get.to(    FilterScreen());

                    },
                    child: Container(
                      width: 60.w,
                      height: 6.h,
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
                            style: lemonMilk500(8.sp, AppColor.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
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

                      ],
                    );
                  },
                ),
              ],
            ),
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
            ),

          ],
        ),
      ),
    );
  }
}

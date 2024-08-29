import 'package:bon_achat/const/colors.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;

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
      'category': 'GADGET / MOBILE',
      'title': 'APPLE IPHONE 15 PRO MAX NATURAL TITANIUM...',
      'price': '\$1000',
      'image': AppImages.ios2,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'AUTOMOBILES / PRIVATE CAR',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$3300',
      'image': AppImages.bmw,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'ANIMAL / CAT',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$390',
      'image': AppImages.cat,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'FASHION / SHOE',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.shoe,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'FASHION / SHOE',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.house,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'FASHION / SHOE',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.televison,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'FASHION / SHOE',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.hedset,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
    {
      'category': 'FASHION / SHOE',
      'title': 'LOREM IPSUM DOLOR SIT AMET CONSECTETUR...',
      'price': '\$383',
      'image': AppImages.bycycle,
      'location': 'UTTARA, DHAKA',
      'time': '30 MINS AGO',
    },
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
            SizedBox(height: 20.h),
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
                      'Current Location',
                      style: lemonMilk500(9.sp, AppColor.grey),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_sharp, color: AppColor.green, size: 13.h),
                        SizedBox(width: 5.w),
                        Text(
                          'Uttara, Dhaka',
                          style: lemonMilk500(13.sp, AppColor.black),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(AppImages.bellicon, height: 24.h, width: 24.w),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
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
            SizedBox(height: 20.h),
            Text(
              'BROWSE BY CATEGORIES',
              style: lemonMilk500(14.sp, AppColor.black),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
            Container(
              height:90.h, // Set height to accommodate the items
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
            SizedBox(height: 10.h,),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'RECENT ',
                    style:lemonMilk500(14.sp, AppColor.black)
                  ),
                  TextSpan(
                    text: 'ADS',
                    style: lemonMilk500(14.sp, AppColor.green)
                  ),
                ],
              ),
            ),            SizedBox(height: 10.h),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.74,
                  ),
                  itemCount: recentAds.length,
                  itemBuilder: (context, index) {
                    final ad = recentAds[index];
                    return Container(
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
                              ad['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 140.h, // Ensure a fixed height or set according to your design
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    
                                      children: [
                                        Image.asset(AppImages.tag,height: 10.h,width: 10.w,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            ad['category']!,
                                            style: lemonMilk400(AppColor.orange, 8.sp)
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isFavorite = !isFavorite; // Toggle the state on tap
                                        });
                                      },
                                      child: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                                        size: 16.h,
                                        color: isFavorite ? Colors.red : Colors.black, // Change color based on state
                                      ),
                                ),
                            ]
                          ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 4), // Adjust the padding if needed
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.08), // Set your desired color
                                        width: 1, // Set the width of the border
                                      ),
                                    ),
                                  ),

                                ),
                                SizedBox(height: 8.h,),

                                Text(
                                  ad['title']!,
                                  style: lemonMilk500(11.sp, AppColor.black)
                                ),
                                SizedBox(height: 8.h,),
                                Text(
                                  ad['price']!,
                                  style: lemonMilk400(AppColor.orange, 10.sp)
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 4.0),
                                          child: Image.asset(AppImages.location,height: 10.h,),
                                        ),
                                        Text(
                                          ad['location']!,
                                          style:lemonMilk400(AppColor.grey, 8.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 4.0),
                                          child: Image.asset(AppImages.clock,height: 10.h,),
                                        ),

                                        Text(
                                          ad['time']!,
                                          style:lemonMilk400(AppColor.grey, 8.sp),
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
                    );
                  },
                ),
              ),

          ],
        ),
      ),
    );
  }
}

import 'package:bon_achat/const/colors.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/images.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../../controllers/home_scr_controllers/view_controller.dart';
import '../ads/ad_details.dart';
import 'bottom_sheet.dart';
import 'filtered_screen.dart'; // Ensure this import points to the correct file containing FilterBottomSheet

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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


    // Add more ads here
  ];
  final ViewController viewController = Get.put(ViewController());

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'COMPUTER',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showFilterBottomSheet(context); // Call the function to show the bottom sheet
                  },
                  icon: Icon(Icons.tune, color:AppColor.orange, size: 18),
                  label: Text(
                    'FILTER',
                    style: lemonMilk400(Colors.white, 14.sp)
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.green,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                _buildOutlinedButton('COMPUTER'),
                SizedBox(width: 10),
                _buildLocationButton('UTTARA, DHAKA'),
              ],
            ),
            SizedBox(height: 10.h,),
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
                              builder: (context) => AdDetailsPage(imagePath: ad['image']!),
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
                                      style: lemonMilk500(11.sp, AppColor.black),
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
                                              style: lemonMilk400(AppColor.grey, 8.sp),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4.0),
                                              child: Image.asset(AppImages.clock, height: 10.h),
                                            ),
                                            Text(
                                              ad['time']!,
                                              style: lemonMilk400(AppColor.grey, 8.sp),
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
                              builder: (context) => AdDetailsPage(imagePath: ad['image']!),
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
                                        style: lemonMilk600(AppColor.black, 12.sp),
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
                                                style: lemonMilk400(AppColor.grey, 8.sp),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 4.0),
                                                child: Image.asset(AppImages.clock, height: 10.h),
                                              ),
                                              Text(
                                                ad['time']!,
                                                style: lemonMilk400(AppColor.grey, 8.sp),
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
                                      Text(
                                        ad['price']!,
                                        style: lemonMilk600(AppColor.green, 14.sp),
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

  // Function to display the bottom sheet
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take up more space if needed
      builder: (BuildContext context) {
        return FilterBottomSheet(); // Ensure this matches the widget you created for the bottom sheet
      },
    );
  }

  Widget _buildOutlinedButton(String text) {
    return OutlinedButton(
      onPressed: () {
        // Select category
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.green),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: lemonMilk400(AppColor.black, 14.sp)
      ),
    );
  }

  Widget _buildLocationButton(String location) {
    return OutlinedButton.icon(
      onPressed: () {
        // Select location
      },
      icon: Icon(Icons.location_on, color:AppColor.orange, size: 18),
      label: Text(
        location,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.green),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}


class FilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Filter your Choice',
                  style: lemonMilk600(Colors.white, 20.sp)
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildDropdownButton('FILTER BY CATEGORIES'),
          SizedBox(height: 16),
          _buildDropdownButton('FILTER BY CITIES'),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'PRICE:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              _buildPriceField('\$00.00'),
              SizedBox(width: 10),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              _buildPriceField('\$00.00'),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
               Get.to(filtered_screen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.orange,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'APPLY FILTER',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDropdownButton(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(5, 84, 46, 1),
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceField(String text) {
    return Container(
      width: 80.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(5, 84, 46, 1),

        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:bon_achat/const/colors.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/images.dart';
import '../../controllers/home_scr_controllers/favourate.dart';
import '../../controllers/home_scr_controllers/view_controller.dart';
import '../ads/ad_details.dart';
import '../home/product_details.dart';
import 'bottom_sheet.dart';
import 'filtered_result.dart';
import 'filtered_screen.dart'; // Ensure this import points to the correct file containing FilterBottomSheet

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedCategory = "FILTER BY  CATEGORIES";  // Default category text
  bool _isExpanded = false;
  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

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
              style: lemonMilk500( 18.sp,AppColor.black,),

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
        centerTitle: false, // Ensures the title is left-aligned next to the leading icon

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 34.h,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showFilterBottomSheet(context); // Call the function to show the bottom sheet
                    },
                    label: Text(
                      'FILTER',
                      style: lemonMilk400(Colors.white, 11.sp)
                    ),
                    icon: Icon(Icons.tune, color:AppColor.orange, size: 18),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.green,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
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
    return SizedBox(
      height: 34.h,

      child: OutlinedButton(
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
          style: lemonMilk400(AppColor.black, 11.sp)
        ),
      ),
    );
  }

  Widget _buildLocationButton(String location) {
    return SizedBox(
      height: 34.h,

      width: 148.w,
      child: OutlinedButton.icon(
        onPressed: () {
          // Select location
        },
        icon: Icon(Icons.location_on, color:AppColor.orange, size: 16),
        label: Text(
          location,
          style: lemonMilk400(AppColor.black, 12.sp)
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColor.green),
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}


class FilterBottomSheet extends StatefulWidget {
  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String _selectedCategory = "FILTER BY  CATEGORIES";
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  // Default category text
  bool _isExpanded = false;

  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;  // Update the selected category
      _isExpanded = false;  // Close the dropdown
    });
  }
  String _selectedCategory1 = "FILTER BY  CITIES";
  // Default category text
  bool _isExpanded1 = false;

  void _toggleDropdown1() {
    setState(() {
      _isExpanded1 = !_isExpanded1;
    });
  }
  void _selectCategory1(String category) {
    setState(() {
      _selectedCategory1 = category;  // Update the selected category
      _isExpanded1 = false;  // Close the dropdown
    });
  }
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _toggleDropdown,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                  color: AppColor.greendark,
                    border: Border.all(color: AppColor.orange),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedCategory,  // Display the selected category

                        style:  lemonMilk400(AppColor.white, 12.sp),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColor.white,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded ? 220.h : 0.h,
                child: _isExpanded
                    ? Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColor.orange,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      _buildCategoryItem('ELECTRONICS', '234', AppImages.electronics),
                      _buildCategoryItem('AUTOMOBILES', '367', AppImages.electronics),
                      _buildCategoryItem('FASHION', '456', AppImages.fashion),
                      _buildCategoryItem('PROPERTIES', '356', AppImages.furniture),
                      _buildCategoryItem('GADGETS', '768', AppImages.fashion),
                      _buildCategoryItem('FURNITURE', '977', AppImages.furniture),
                    ],
                  ),
                )
                    : Container(),
              ),
            ],
          ),

          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _toggleDropdown1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: AppColor.greendark,
                    border: Border.all(color: AppColor.orange),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedCategory1,  // Display the selected category

                        style:  lemonMilk400(AppColor.white, 12.sp),
                      ),
                      Icon(
                        _isExpanded1
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColor.white,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded1 ? 160.h : 0.h,
                child: _isExpanded1
                    ? Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColor.orange,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      _buildCategoryItem1('Los Angeles', '234'),
                      _buildCategoryItem1('San Francisco', '367'),
                      _buildCategoryItem1('California', '456'),
                      _buildCategoryItem1('Baltimore', '356'),
                      _buildCategoryItem1('Avocados', '768'),
                    ],
                  ),
                )
                    : Container(),
              ),
            ],
          ),
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
              _buildPriceField(_minPriceController, '\$00.00'), // For minimum price
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
              _buildPriceField(_maxPriceController, '\$00.00'), // For maximum price
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(FilterResultScreen());
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
                style: lemonMilk500(15.sp, AppColor.white),

              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCategoryItem(String title, String count, String imageAsset) {
    return GestureDetector(
      onTap: () => _selectCategory(title),  // Update the category when tapped

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            Image.asset(imageAsset, width: 24.w, height: 24.h),
            SizedBox(width: 12.w),
            Text(
              title,
              style: lemonMilk400(AppColor.white, 12.sp),
            ),
            Spacer(),
            Text(
              '($count)',
              style: lemonMilk400(AppColor.white, 12.sp),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCategoryItem1(String title, String count) {
    return GestureDetector(
      onTap: () => _selectCategory1(title),  // Update the category when tapped

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [

            Text(
              title,
              style: lemonMilk400(AppColor.white, 12.sp),
            ),
            Spacer(),
            Text(
              '($count)',
              style: lemonMilk400(AppColor.white, 12.sp),
            ),
          ],
        ),
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

  Widget _buildPriceField(TextEditingController controller, String hintText) {
    return SizedBox(
      width: 119.w, // Adjust the width as per your design
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          fillColor: AppColor.greendark, // Set the background color
          filled: true, // Ensure the background color is applied
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColor.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColor.orange),
          ),
        ),
      ),
    );

  }
}

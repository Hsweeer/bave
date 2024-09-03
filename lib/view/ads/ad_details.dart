import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../person_profile/person_profile.dart';

class AdDetailsPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String location;

  AdDetailsPage({
    required this.imagePath,
    required this.title,
    required this.location,
  });

  @override
  State<AdDetailsPage> createState() => _AdDetailsPageState();
}

class _AdDetailsPageState extends State<AdDetailsPage> {
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColor.green,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 130.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.done,
                          width: 150.w,
                          height: 140.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'MARKED AS SOLD \nSUCCESSFULLY',
                      textAlign: TextAlign.center,
                      style: lemonMilkWithColor800(AppColor.white, 18.sp),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Congratulations!  Marked as Sold \nSuccessfully.',
                      textAlign: TextAlign.center,
                      style: lemonMilk500(12.sp, AppColor.white),
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          backgroundColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'GREAT',
                          style: lemonMilkWithColor800(AppColor.white, 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void _showSuccessDialog2() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColor.green,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 130.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.done,
                          width: 150.w,
                          height: 140.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'ARE YOU SURE?',
                      textAlign: TextAlign.center,
                      style: lemonMilkWithColor800(AppColor.white, 18.sp),
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          backgroundColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'YES, DELETE',
                          style: lemonMilkWithColor800(AppColor.white, 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
          width: double.infinity, // Set the width to the full screen width
          height: 313.h, //
                     child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,  // Adjust these values to position the icons
                      right: 8,
                      child:
                      Row(
                        children: [
                          // Circular container with an image for edit action
                          GestureDetector(
                            onTap: () {
                              // Handle edit action
                            },
                            child: Container(
                              width: 40.w, // Adjust size as needed
                              height: 40.h, // Adjust size as needed
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.green, // Optional background color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.heart, // Replace with your edit icon image path
                                    width: 24.w, // Adjust size as needed
                                    height: 24.h, // Adjust size as needed
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w), // Space between the icons
                          // Circular container with an image for share action
                          GestureDetector(
                            onTap: () {
                              // Handle share action
                            },
                            child: Container(
                              width: 40.w, // Adjust size as needed
                              height: 40.h, // Adjust size as needed
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.green, // Optional background color
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    AppImages.setting, // Replace with your share icon image path
                                    width: 24.w, // Adjust size as needed
                                    height: 24.h, // Adjust size as needed
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section

                    Row(
                      children: [
                        Image.asset(
                          AppImages.tagg, // Replace with your category icon image path
                          color: Colors.grey,
                          width: 14.w, // Adjust size as needed
                          height: 14.h, // Adjust size as needed
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'GADGET / LAPTOP',
                          style: lemonMilk400(AppColor.grey, 10.sp),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.eye, // Replace with your preview icon image path
                              width: 24.w, // Adjust size as needed
                              height: 24.h, // Adjust size as needed
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '(134) PREVIEW',
                              style: lemonMilk500(8.sp, AppColor.black),
                            ),
                            SizedBox(width: 16.w), // Spacing between preview and clicks
                            Image.asset(
                              AppImages.mouse, // Replace with your clicks icon image path
                              width: 24.w, // Adjust size as needed
                              height: 24.h, // Adjust size as needed
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '(76) CLICKS',
                              style: lemonMilk500(8.sp, AppColor.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h), // Spacing between rows
                    Row(
                      children: [
                        Image.asset(
                          AppImages.location, // Replace with your location icon image path
                          color: Colors.grey,
                          width: 12.w, // Adjust size as needed
                          height: 12.h, // Adjust size as needed
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          widget.location,
                          style: lemonMilk500(10.sp, AppColor.black),
                        ),
                      ],
                    ),

                    // Title, Price, and Call to Action
                    Text(
                        widget.title,
                        style: lemonMilkWithColor500(AppColor.black,20.sp)
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: 40.w,),

                        Container(
                          width: 150.w,
                          height: 60.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "\$2347",
                                    style:  lemonMilk500(16.sp,AppColor.white)
                                ),
                                SizedBox(width: 0.w),
                                Icon(Icons.edit_attributes, color: AppColor.white, size: 18.sp),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          width: 150.w,
                          height: 60.h,
                          child: ElevatedButton(

                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "(+800)",
                                    style:  lemonMilk500(16.sp,AppColor.white)
                                ),
                                SizedBox(width: 8.w),
                                Icon(Icons.phone, color: AppColor.white, size: 18.sp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Specifications Section
                    _buildSectionTitle("SPECIFICATIONS:"),
                    _buildSpecification("Price:", "\$2,347"),
                    _buildSpecification("Seller Type:", "Personal"),
                    _buildSpecification("Published:", "February 02, 2021"),
                    _buildSpecification("Location:", "Jalkuri, Narayanganj"),
                    _buildSpecification("Category:", "Gadgets"),
                    _buildSpecification("Condition:", "Used"),
                    _buildSpecification("Price Type:", "Negotiable"),

                    SizedBox(height: 16.h),

                    // Description Section
                    _buildSectionTitle("DESCRIPTION"),

                    Container(
                      width: 353.w,
                      height: 286.h,
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColor.greyl
                      ),
                      child: Text(
                          "Lorem ipsum dolor sit amet, cLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui...Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui...onsectetur adipiscing elit. Ut magna utas vitae qui...Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui...Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui...Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui...Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui... ",
                          style:  lemonMilk400(AppColor.grey,12.sp,)
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Author Info
                    _buildSectionTitle("AUTHOR INFO"),
                    SizedBox(height: 10.h),

                    Container(
                      width: 353.w,

                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColor.greyl
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.yellow,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      // builder: (context) => HomePagenav(), // Replace with your next page widget
                                      builder: (context) => ProfileScreen(), // Replace with your next page widget
                                    ));
                                  },

                                  child: Image.asset(
                                    AppImages.profile,
                                    fit: BoxFit.cover, // Adjust this property as needed
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jackon Honson',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                      'JOINED: FEBRUARY 02, 2021',
                                      style:  lemonMilk400(AppColor.grey,12.sp,)

                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                              'CORPORIS DOLORE LIBERO TEMPORIBUS MINUS TEMPORA QUIA VOLUPTAS NESCIUNT.',
                              style:  lemonMilk400(AppColor.grey,12.sp,)

                          ),
                          SizedBox(height: 16),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'TOTAL ADS',
                                    style:  lemonMilk500(13.sp,AppColor.black)

                                ),
                                Text(
                                    '134',
                                    style: lemonMilk500(13.sp,AppColor.black)

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),              SizedBox(height: 16.h),

                    // Location Section
                    _buildSectionTitle("LOCATION"),
                    Container(
                      height: 370.h,
                      width: 352.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.lightGrey,
                      ),
                      child:  Image.asset(
                        AppImages.map,
                        fit: BoxFit.cover, // Adjust this property as needed
                      ),
                    ),
                    SizedBox(height: 16.h),

                    _buildSectionTitle("SAFETY TIPS"),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       color: Color.fromRGBO(247, 247, 247, 1),

                     ),
                     child: Column(children: [
                       _buildSafetyTip("Check the item before you buy"),
                       _buildSafetyTip("Pay only after collecting the item"),
                       _buildSafetyTip("Beware of unrealistic offers"),
                       _buildSafetyTip("Meet seller at a safe location"),
                       _buildSafetyTip("Do not make an abrupt decision"),
                       _buildSafetyTip("Be honest with the ad you post"),
                     ],),
                   ),

                    SizedBox(height: 16.h),

                    // Admin Approval Section
                    Container(
                      width: double.infinity,

                      child: Text(
                        "PLEASE WAIT FOR ADMIN APPROVAL",
                        style: lemonMilk500(12.sp,AppColor.black),

                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Delete Ad Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160.w,
                          height: 55.h,
                          child: ElevatedButton(
                            onPressed: _showSuccessDialog,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orange,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                  "MARK AS SOLD",
                                  style: lemonMilk500(15.sp,AppColor.white)

                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        SizedBox(
                          width: 160.w,
                          height: 55.h,
                          child: ElevatedButton(
                            onPressed: _showSuccessDialog2,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.red,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                  "DELETE AD",
                                  style: lemonMilk500(15.sp,AppColor.white)

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
          title,
          style:lemonMilk500(15.sp,AppColor.black)

      ),
    );
  }

  Widget _buildSpecification(String key, String value) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        width: 353.w,
        height: 46.h,

        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.greyl
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                key,
                style: lemonMilk500(12.sp,AppColor.black)

            ),
            Spacer(),

            Text(
              value,
              style :lemonMilk400(AppColor.grey,12.sp),

            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSafetyTip(String tip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.greyl,
        ),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: AppColor.orange,
              size: 16.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                tip,
                style :lemonMilk400(AppColor.black,12.sp),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
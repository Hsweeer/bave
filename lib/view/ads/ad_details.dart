import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../const/images.dart';

class AdDetailsPage extends StatelessWidget {
  final String imagePath;

  AdDetailsPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: 393,
                height: 313,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover, // Adjust this property as needed
                  ),
                ),
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
          
          
                    // Title, Price, and Call to Action
                    Text(
                      "APPLE MACBOOK PRO WITH M1 CHIP...",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: 40.w,),

                        ElevatedButton(
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
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(Icons.edit_attributes, color: AppColor.white, size: 18.sp),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "(+800)",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(Icons.phone, color: AppColor.white, size: 18.sp),
                            ],
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
                      height: 46.h,
          
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColor.greyl
                      ),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna utas vitae qui... ",
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 14.sp,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
          
                    // Author Info
                    _buildSectionTitle("AUTHOR INFO"),
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
                              child: Icon(Icons.person, color: Colors.black, size: 30),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'YOU',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'JOINED: FEBRUARY 02, 2021',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'CORPORIS DOLORE LIBERO TEMPORIBUS MINUS TEMPORA QUIA VOLUPTAS NESCIUNT.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
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
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '134',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
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
                      height: 354.h,
                      width: 352.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.lightgrey,
                      ),
                      child:  Image.asset(
                        AppImages.map,
                        fit: BoxFit.cover, // Adjust this property as needed
                      ),
                    ),
                    SizedBox(height: 16.h),
          
                    // Safety Tips Section
                    _buildSectionTitle("SAFETY TIPS"),
                    _buildSafetyTip("Check the item before you buy"),
                    _buildSafetyTip("Pay only after collecting the item"),
                    _buildSafetyTip("Beware of unrealistic offers"),
                    _buildSafetyTip("Meet seller at a safe location"),
                    _buildSafetyTip("Do not make an abrupt decision"),
                    _buildSafetyTip("Be honest with the ad you post"),
          
                    SizedBox(height: 16.h),
          
                    // Admin Approval Section
                    Container(
                      width: double.infinity,

                      child: Text(
                        "PLEASE WAIT FOR ADMIN APPROVAL",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16.h),
          
                    // Delete Ad Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle Delete
                      },
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
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                      ),
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
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
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
              style: TextStyle(
                color: AppColor.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),

              Text(
                value,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 14.sp,
                ),
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
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/svg_img.dart';
import '../../const/text_style.dart';

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({super.key});

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  List<XFile> _uploadedFiles = [];
  bool _isExpanded = false;
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  String _selectedCategory = "CHOOSE CATEGORY";  // Default category text
  String _selectedCategory1 = "PRICE CONDITION";  // Default category text
  String _selectedCategory2 ="PRODUCT CONDITION";   // Default category text




  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
  void _toggleDropdown1() {
    setState(() {
      _isExpanded1 = !_isExpanded1;
    });
  }
  void _toggleDropdown2() {
    setState(() {
      _isExpanded2= !_isExpanded2;
    });
  }
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;  // Update the selected category
      _isExpanded = false;  // Close the dropdown
    });
  }
  void _selectCategory1(String category) {
    setState(() {
      _selectedCategory1 = category;  // Update the selected category
      _isExpanded1 = false;  // Close the dropdown
    });
  }
  void _selectCategory2(String category) {
    setState(() {
      _selectedCategory2 = category;  // Update the selected category
      _isExpanded2 = false;  // Close the dropdown
    });
  }

  // Method to pick multiple images/videos
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      setState(() {
        _uploadedFiles.addAll(images);
      });
    }
  }
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
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.done,
                          width: 130.w,
                          height: 140.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'AD POSTED\nSUCCESSFULLY',
                      textAlign: TextAlign.center,
                      style: lemonMilkWithColor500(AppColor.white, 16.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'PLEASE WAIT FOR ADMIN APPROVAL.',
                      textAlign: TextAlign.center,
                      style: lemonMilk500(9.sp, AppColor.white),
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
                          style: lemonMilkWithColor500(AppColor.white, 15.sp),
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
                    color: AppColor.white,
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

  void _removeImage(int index) {
    setState(() {
      _uploadedFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.black, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'POST AD',
          style: lemonMilkWithColor500(AppColor.black, 18.sp),
        ),
        centerTitle: false, // Ensures the title is left-aligned next to the leading icon

        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            Text(
              'ENTER THE FOLLOWING DETAILS ',
              style: lemonMilk500( 12.sp,AppColor.grey),
            ),
            SizedBox(height: 20.h),
            Text(
              'AD INFORMATION:',
              style: lemonMilkWithColor500(AppColor.black, 15.sp),
            ),
            SizedBox(height: 15.h),
            _buildTextField('PRODUCT TITLE'),
            SizedBox(height: 20.h),
            _buildPhotoUploadBox(),
            SizedBox(height: 20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _toggleDropdown,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.green, width: 1.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedCategory,  // Display the selected category

                        style:  lemonMilk400(AppColor.black2, 12.sp),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColor.black,
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
                    color: AppColor.green,
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
          SizedBox(height: 20.h),
            _buildTextField('PRICE'),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _toggleDropdown1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.green, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                    _selectedCategory1,
                    style:  lemonMilk400(AppColor.black2, 12.sp),
                        ),
                        Icon(
                          _isExpanded1
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColor.black,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _isExpanded1 ? 180.h : 0.h,
                  child: _isExpanded1
                      ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        PRICECONDITION('Fixed'),
                        PRICECONDITION('Negotiable'),
                        PRICECONDITION('Daily'),
                        PRICECONDITION('Weekly'),
                        PRICECONDITION('Monthly'),
                        PRICECONDITION('Yearly'),
                      ],
                    ),
                  )
                      : Container(),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _toggleDropdown2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.green, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                    _selectedCategory2,
                    style:  lemonMilk400(AppColor.black2, 12.sp),
                        ),
                        Icon(
                          _isExpanded2
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColor.black,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _isExpanded2 ? 75.h : 0.h,
                  child: _isExpanded2
                      ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        PRODUCTCONDITION('New'),
                        PRODUCTCONDITION('Used'),

                      ],
                    ),
                  )
                      : Container(),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'AD DESCRIPTION:',
              style: lemonMilkWithColor500(AppColor.black, 15.sp),
            ),
            SizedBox(height: 10.h),
            _buildDescriptionField('ADD PRODUCT DESCRIPTION'),
            SizedBox(height: 20.h),
            Text(
              "SELLER INFORMATION:",
              style: lemonMilkWithColor500(AppColor.black, 15.sp),
            ),
            SizedBox(height: 10.h),
            _buildTextField('NAME'),
            SizedBox(height: 20.h),
            _buildTextField('EMAILS'),
            SizedBox(height: 20.h),
            _buildPhoneNumberField(),
            SizedBox(height: 20.h),
            _buildTextField('CITY'),
            SizedBox(height: 30.h),
            _buildPostButton(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lemonMilk400(AppColor.black2, 12.sp),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hintText) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lemonMilk400(AppColor.black2, 12.sp),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      items: const [],
      onChanged: (value) {},
    );
  }

  Widget _buildDescriptionField(String hintText) {
    return TextField(
      maxLines: 5,
      style: lemonMilk500( 11.sp,AppColor.black),  // Apply lemonMilk400 to the typed text

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lemonMilk400(AppColor.black2, 12.sp),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  Widget _buildPhotoUploadBox() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 158.h, // Set the desired height (modify as needed)
        width: 353.w,  // Set the desired width (modify as needed)
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.green, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
          color: AppColor.white,
        ),
        child: _uploadedFiles.isEmpty
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppSvgs.upload
                ,                color: AppColor.black2,
                width: 16.w,
                height: 16.h,
              ),
              SizedBox(height: 10.0),
              Text(
                'ADD PRODUCT PHOTOS/VIDEO',
                style: TextStyle(
                  color: AppColor.black2,
                  fontSize: 14.0, // Adjust font size to match ImageUploadScreen
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        )
            : SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: _uploadedFiles.length + 1,
            itemBuilder: (context, index) {
              if (index == _uploadedFiles.length) {
                // Render the add button at the end
                return GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 90.w,
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.green, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColor.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: AppColor.black2,
                          size: 24.0,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'ADD PRODUCT PHOTOS/VIDEO',
                          textAlign: TextAlign.center,
                          style: lemonMilkWithColor500(AppColor.black2, 12.sp),

                        ),
                      ],
                    ),
                  ),
                );
              }

              // Render the uploaded images
              return Stack(
                children: [
                  Container(
                    width: 245.w,
                    height: 224.h,
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: FileImage(File(_uploadedFiles[index].path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 18.0,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Container(
                        width: 14.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          color: AppColor.red,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(6), // Use Radius.circular(8) instead of just 8
                              bottom: Radius.circular(6), // Use Radius.circular(8) instead of just 8
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(AppImages.delete,height: 15.h,width: 15.w,),
                        )
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }


  Widget _buildPhoneNumberField() {
    return TextField(
      decoration: InputDecoration(
        hintText: '+1 | ENTER PHONE NUMBER',
        hintStyle: lemonMilk400(AppColor.black2, 12.sp),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      keyboardType: TextInputType.phone,  // This sets the keyboard type to numeric
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],  // Restricts input to numbers only
    );
  }
  Widget buildCircularTickIcon() {
    return Container(
      width: 14.w,  // Adjust the size as needed
      height: 14.h,
      decoration: BoxDecoration(
        color:  AppColor.white,  // Background color of the circle
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,  // Tick icon
        color: AppColor.orange,  // Icon color
        size: 15.0,  // Icon size
      ),
    );
  }
  Widget _buildPostButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _showSuccessDialog,

        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          backgroundColor: AppColor.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCircularTickIcon(),
            SizedBox(width: 10.w,),
            Text(
              'POST YOUR AD',
              style: lemonMilkWithColor500(AppColor.white, 15.sp),
            ),
          ],
        ),
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
  Widget PRICECONDITION(String title) {
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

          ],
        ),
      ),
    );
  } Widget PRODUCTCONDITION(String title) {
    return GestureDetector(
      onTap: () => _selectCategory2(title),  // Update the category when tapped

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            Text(
              title,
              style: lemonMilk400(AppColor.white, 12.sp),
            ),

          ],
        ),
      ),
    );
  }

}

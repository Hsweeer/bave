// // import 'dart:io';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// //
// // import '../../const/colors.dart';
// //
// // class PostAdScreen extends StatefulWidget {
// //   const PostAdScreen({super.key});
// //
// //   @override
// //   State<PostAdScreen> createState() => _PostAdScreenState();
// // }
// //
// // class _PostAdScreenState extends State<PostAdScreen> {
// //   List<XFile> _uploadedFiles = [];
// //
// //   // Method to pick multiple images/videos
// //   Future<void> _pickImage() async {
// //     final ImagePicker _picker = ImagePicker();
// //     final List<XFile>? images = await _picker.pickMultiImage();
// //
// //     if (images != null && images.isNotEmpty) {
// //       setState(() {
// //         _uploadedFiles.addAll(images);
// //       });
// //     }
// //   }
// //
// //   // Method to remove selected image/video
// //   void _removeImage(int index) {
// //     setState(() {
// //       _uploadedFiles.removeAt(index);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColor.white,
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: AppColor.black),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: const Text(
// //           'POST AD',
// //           style: TextStyle(
// //             color: AppColor.black,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         backgroundColor: AppColor.white,
// //         elevation: 0,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: ListView(
// //           children: [
// //             const Text(
// //               'ENTER THE FOLLOWING DETAILS TO POST AD',
// //               style: TextStyle(
// //                 color: AppColor.grey,
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               'AD INFORMATION:',
// //               style: TextStyle(
// //                 color: AppColor.black,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             _buildTextField('PRODUCT TITLE'),
// //             const SizedBox(height: 20),
// //             _buildPhotoUploadBox(),
// //             const SizedBox(height: 20),
// //             _buildDropdownField('CHOOSE CATEGORY'),
// //             const SizedBox(height: 20),
// //             _buildTextField('PRICE'),
// //             const SizedBox(height: 20),
// //             _buildDropdownField('PRICE CONDITION'),
// //             const SizedBox(height: 20),
// //             _buildDropdownField('PRODUCT CONDITION'),
// //             const SizedBox(height: 20),
// //             const Text(
// //               'AD DESCRIPTION:',
// //               style: TextStyle(
// //                 color: AppColor.black,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             _buildDescriptionField('ADD PRODUCT DESCRIPTION'),
// //             const SizedBox(height: 20),
// //             const Text(
// //               "AUTHOR'S INFORMATION:",
// //               style: TextStyle(
// //                 color: AppColor.black,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             _buildTextField('NAME'),
// //             const SizedBox(height: 20),
// //             _buildTextField('EMAILS'),
// //             const SizedBox(height: 20),
// //             _buildPhoneNumberField(),
// //             const SizedBox(height: 20),
// //             _buildTextField('CITY'),
// //             const SizedBox(height: 30),
// //             _buildPostButton(),
// //             const SizedBox(height: 30),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTextField(String hintText) {
// //     return TextField(
// //       decoration: InputDecoration(
// //         hintText: hintText,
// //         hintStyle: const TextStyle(
// //           color: AppColor.black2,
// //         ),
// //         border: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildDropdownField(String hintText) {
// //     return DropdownButtonFormField<String>(
// //       decoration: InputDecoration(
// //         hintText: hintText,
// //         hintStyle: const TextStyle(
// //           color: AppColor.black2,
// //         ),
// //         border: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //       ),
// //       items: const [],
// //       onChanged: (value) {},
// //     );
// //   }
// //
// //   Widget _buildDescriptionField(String hintText) {
// //     return TextField(
// //       maxLines: 5,
// //       decoration: InputDecoration(
// //         hintText: hintText,
// //         hintStyle: const TextStyle(
// //           color: AppColor.black2,
// //         ),
// //         border: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildPhotoUploadBox() {
// //     return GestureDetector(
// //       onTap: _pickImage,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
// //         decoration: BoxDecoration(
// //           border: Border.all(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         child: _uploadedFiles.isEmpty
// //             ? Center(
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: const [
// //               Icon(
// //                 Icons.upload_file,
// //                 color: AppColor.black2,
// //                 size: 24,
// //               ),
// //               SizedBox(height: 5),
// //               Text(
// //                 'ADD PRODUCT PHOTOS/VIDEO',
// //                 style: TextStyle(
// //                   color: AppColor.black2,
// //                   fontSize: 12,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         )
// //             : SizedBox(
// //           height: 90,
// //           child: ListView.builder(
// //             scrollDirection: Axis.horizontal,
// //             padding: const EdgeInsets.symmetric(horizontal: 8),
// //             itemCount: _uploadedFiles.length + 1,
// //             itemBuilder: (context, index) {
// //               if (index == _uploadedFiles.length) {
// //                 // Render the add button at the end
// //                 return GestureDetector(
// //                   onTap: _pickImage,
// //                   child: Container(
// //                     width: 90,
// //                     margin: const EdgeInsets.only(right: 8),
// //                     decoration: BoxDecoration(
// //                       border: Border.all(color: AppColor.green),
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: const [
// //                         Icon(
// //                           Icons.upload_file,
// //                           color: AppColor.black2,
// //                           size: 24,
// //                         ),
// //                         SizedBox(height: 5),
// //                         Text(
// //                           'ADD PRODUCT PHOTOS/VIDEO',
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(
// //                             fontSize: 10,
// //                             color: AppColor.black2,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               }
// //
// //               // Render the uploaded images
// //               return Stack(
// //                 children: [
// //                   Container(
// //                     width: 90,
// //                     margin: const EdgeInsets.only(right: 8),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(8),
// //                       image: DecorationImage(
// //                         image: FileImage(File(_uploadedFiles[index].path)),
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     top: 4,
// //                     right: 4,
// //                     child: GestureDetector(
// //                       onTap: () => _removeImage(index),
// //                       child: Container(
// //                         width: 20,
// //                         height: 20,
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: const Icon(
// //                           Icons.cancel,
// //                           color: Colors.red,
// //                           size: 16,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildPhoneNumberField() {
// //     return TextField(
// //       decoration: InputDecoration(
// //         hintText: '+1 ENTER PHONE NUMBER',
// //         hintStyle: const TextStyle(
// //           color: AppColor.black2,
// //         ),
// //         border: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(color: AppColor.green),
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         prefixIcon: Padding(
// //           padding: const EdgeInsets.only(left: 10),
// //           child: Text(
// //             '+1',
// //             style: const TextStyle(
// //               color: AppColor.black2,
// //             ),
// //           ),
// //         ),
// //       ),
// //       keyboardType: TextInputType.phone,
// //     );
// //   }
// //
// //   Widget _buildPostButton() {
// //     return SizedBox(
// //       width: double.infinity,
// //       child: ElevatedButton(
// //         onPressed: () {},
// //         style: ElevatedButton.styleFrom(
// //           padding: const EdgeInsets.all(16),
// //           backgroundColor: AppColor.orange,
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //         ),
// //         child: const Text(
// //           'POST YOUR AD',
// //           style: TextStyle(
// //             color: AppColor.white,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../const/colors.dart';
// import '../../const/text_style.dart';
//
// class PostAdScreen extends StatefulWidget {
//   const PostAdScreen({super.key});
//
//   @override
//   State<PostAdScreen> createState() => _PostAdScreenState();
// }
//
// class _PostAdScreenState extends State<PostAdScreen> {
//   List<XFile> _uploadedFiles = [];
//
//   // Method to pick multiple images/videos
//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final List<XFile>? images = await _picker.pickMultiImage();
//
//     if (images != null && images.isNotEmpty) {
//       setState(() {
//         _uploadedFiles.addAll(images);
//       });
//     }
//   }
//
//   // Method to remove selected image/video
//   void _removeImage(int index) {
//     setState(() {
//       _uploadedFiles.removeAt(index);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: AppColor.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'POST AD',
//           style: lemonMilkWithColor800(AppColor.black, 18),
//         ),
//         backgroundColor: AppColor.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: ListView(
//           children: [
//             Text(
//               'ENTER THE FOLLOWING DETAILS TO POST AD',
//               style: lemonMilk400(AppColor.grey, 14),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'AD INFORMATION:',
//               style: lemonMilkWithColor700(AppColor.black, 16),
//             ),
//             const SizedBox(height: 10),
//             _buildTextField('PRODUCT TITLE'),
//             const SizedBox(height: 20),
//             _buildPhotoUploadBox(),
//             const SizedBox(height: 20),
//             _buildDropdownField('CHOOSE CATEGORY'),
//             const SizedBox(height: 20),
//             _buildTextField('PRICE'),
//             const SizedBox(height: 20),
//             _buildDropdownField('PRICE CONDITION'),
//             const SizedBox(height: 20),
//             _buildDropdownField('PRODUCT CONDITION'),
//             const SizedBox(height: 20),
//             Text(
//               'AD DESCRIPTION:',
//               style: lemonMilkWithColor700(AppColor.black, 16),
//             ),
//             const SizedBox(height: 10),
//             _buildDescriptionField('ADD PRODUCT DESCRIPTION'),
//             const SizedBox(height: 20),
//             Text(
//               "AUTHOR'S INFORMATION:",
//               style: lemonMilkWithColor700(AppColor.black, 16),
//             ),
//             const SizedBox(height: 10),
//             _buildTextField('NAME'),
//             const SizedBox(height: 20),
//             _buildTextField('EMAILS'),
//             const SizedBox(height: 20),
//             _buildPhoneNumberField(),
//             const SizedBox(height: 20),
//             _buildTextField('CITY'),
//             const SizedBox(height: 30),
//             _buildPostButton(),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String hintText) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: lemonMilk400(AppColor.black2, 14),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropdownField(String hintText) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: lemonMilk400(AppColor.black2, 14),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       items: const [],
//       onChanged: (value) {},
//     );
//   }
//
//   Widget _buildDescriptionField(String hintText) {
//     return TextField(
//       maxLines: 5,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: lemonMilk400(AppColor.black2, 14),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPhotoUploadBox() {
//     return GestureDetector(
//       onTap: _pickImage,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: _uploadedFiles.isEmpty
//             ? Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(
//                 Icons.upload_file,
//                 color: AppColor.black2,
//                 size: 24,
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'ADD PRODUCT PHOTOS/VIDEO',
//                 style: lemonMilk400(AppColor.black2, 12),
//               ),
//             ],
//           ),
//         )
//             : SizedBox(
//           height: 90,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             itemCount: _uploadedFiles.length + 1,
//             itemBuilder: (context, index) {
//               if (index == _uploadedFiles.length) {
//                 // Render the add button at the end
//                 return GestureDetector(
//                   onTap: _pickImage,
//                   child: Container(
//                     width: 90,
//                     margin: const EdgeInsets.only(right: 8),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColor.green),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.upload_file,
//                           color: AppColor.black2,
//                           size: 24,
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           'ADD PRODUCT PHOTOS/VIDEO',
//                           textAlign: TextAlign.center,
//                           style: lemonMilk400(AppColor.black2, 10),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }
//
//               // Render the uploaded images
//               return Stack(
//                 children: [
//                   Container(
//                     width: 90,
//                     margin: const EdgeInsets.only(right: 8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       image: DecorationImage(
//                         image: FileImage(File(_uploadedFiles[index].path)),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 4,
//                     right: 4,
//                     child: GestureDetector(
//                       onTap: () => _removeImage(index),
//                       child: Container(
//                         width: 20,
//                         height: 20,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.cancel,
//                           color: Colors.red,
//                           size: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPhoneNumberField() {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: '+1 ENTER PHONE NUMBER',
//         hintStyle: lemonMilk400(AppColor.black2, 14),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.green),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Text(
//             '+1',
//             style: lemonMilk400(AppColor.black2, 14),
//           ),
//         ),
//       ),
//       keyboardType: TextInputType.phone,
//     );
//   }
//
//   Widget _buildPostButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.all(16),
//           backgroundColor: AppColor.orange,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Text(
//           'POST YOUR AD',
//           style: lemonMilkWithColor700(AppColor.white, 16),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../const/colors.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({super.key});

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  List<XFile> _uploadedFiles = [];

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
                      'AD POSTED\nSUCCESSFULLY',
                      textAlign: TextAlign.center,
                      style: lemonMilkWithColor800(AppColor.white, 18.sp),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'PLEASE WAIT FOR ADMIN APPROVAL.',
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

  // void _showSuccessDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.r),
  //         ),
  //         child: Container(
  //           width: 300.w,
  //           padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
  //           decoration: BoxDecoration(
  //             color: AppColor.green,
  //             borderRadius: BorderRadius.circular(20.r),
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Container(
  //                 width: 130.w,
  //                 height: 140.h,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   shape: BoxShape.circle,
  //                 ),
  //                 child: Center(
  //                   child: Image.asset(
  //                     AppImages.done,
  //                     width: 150.w,
  //                     height: 140.h,
  //                     fit: BoxFit.fill,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 20.h),
  //               Text(
  //                 'AD POSTED\nSUCCESSFULLY',
  //                 textAlign: TextAlign.center,
  //                 style: lemonMilkWithColor800(AppColor.white, 18.sp),
  //               ),
  //               SizedBox(height: 15.h),
  //               Text(
  //                 'PLEASE WAIT FOR ADMIN APPROVAL.',
  //                 textAlign: TextAlign.center,
  //                 style: lemonMilk500(12.sp, AppColor.white),
  //               ),
  //               SizedBox(height: 24.h),
  //               SizedBox(
  //                 width: double.infinity,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     padding: EdgeInsets.symmetric(vertical: 14.h),
  //                     backgroundColor: AppColor.orange,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8.r),
  //                     ),
  //                   ),
  //                   child: Text(
  //                     'GREAT',
  //                     style: lemonMilkWithColor800(AppColor.white, 16.sp),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Method to remove selected image/video
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
          style: lemonMilkWithColor800(AppColor.black, 18.sp),
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            Text(
              'ENTER THE FOLLOWING DETAILS TO POST AD',
              style: lemonMilk400(AppColor.grey, 14.sp),
            ),
            SizedBox(height: 20.h),
            Text(
              'AD INFORMATION:',
              style: lemonMilkWithColor700(AppColor.black, 16.sp),
            ),
            SizedBox(height: 10.h),
            _buildTextField('PRODUCT TITLE'),
            SizedBox(height: 20.h),
            _buildPhotoUploadBox(),
            SizedBox(height: 20.h),
            _buildDropdownField('CHOOSE CATEGORY'),
            SizedBox(height: 20.h),
            _buildTextField('PRICE'),
            SizedBox(height: 20.h),
            _buildDropdownField('PRICE CONDITION'),
            SizedBox(height: 20.h),
            _buildDropdownField('PRODUCT CONDITION'),
            SizedBox(height: 20.h),
            Text(
              'AD DESCRIPTION:',
              style: lemonMilkWithColor700(AppColor.black, 16.sp),
            ),
            SizedBox(height: 10.h),
            _buildDescriptionField('ADD PRODUCT DESCRIPTION'),
            SizedBox(height: 20.h),
            Text(
              "AUTHOR'S INFORMATION:",
              style: lemonMilkWithColor700(AppColor.black, 16.sp),
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
        hintStyle: lemonMilk400(AppColor.black2, 14.sp),
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
        hintStyle: lemonMilk400(AppColor.black2, 14.sp),
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
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lemonMilk400(AppColor.black2, 14.sp),
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
        height: 158.h,
        width: 353.w,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: _uploadedFiles.isEmpty
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.upload_outlined,
                color: AppColor.black2,
                size: 24.sp,
              ),
              SizedBox(height: 5.h),
              Text(
                'ADD PRODUCT PHOTOS/VIDEO',
                style: lemonMilk400(AppColor.black2, 12.sp),
              ),
            ],
          ),
        )
            : SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            itemCount: _uploadedFiles.length + 1,
            itemBuilder: (context, index) {
              if (index == _uploadedFiles.length) {
                // Render the add button at the end
                return GestureDetector(
                  onTap: _pickImage,
                  child: Container(

                    width: 90.w,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.green, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: AppColor.black2,
                          size: 24.sp,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'ADD PRODUCT PHOTOS/VIDEO',
                          textAlign: TextAlign.center,
                          style: lemonMilk400(AppColor.black2, 10.sp),
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
                    width: 90.w,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: FileImage(File(_uploadedFiles[index].path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4.h,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 16.sp,
                        ),
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
        hintText: '+1 ENTER PHONE NUMBER',
        hintStyle: lemonMilk400(AppColor.black2, 14.sp),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.green, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            '+1',
            style: lemonMilk400(AppColor.black2, 14.sp),
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
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
        child: Text(
          'Post Your Ad',
          style: lemonMilkWithColor800(AppColor.white, 16.sp),
        ),
      ),
    );
  }
}

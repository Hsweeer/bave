import 'package:bon_achat/view/auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import '../../const/colors.dart';
import '../../const/text_style.dart';
import '../home/HomePagenavv.dart';

class otpVerificationScreen extends StatefulWidget {
  @override
  _otpVerificationScreenState createState() =>
      _otpVerificationScreenState();
}

class _otpVerificationScreenState
    extends State<otpVerificationScreen> {
  // Variables to hold OTP values
  List<String> otp = ["", "", "", ""];
  int remainingSeconds = 20; // Timer for resend code
  bool isTimerActive = true; // Control the resend timer

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (remainingSeconds > 0 && mounted) {
        setState(() {
          remainingSeconds--;
        });
        startTimer();
      } else {
        setState(() {
          isTimerActive = false;
        });
      }
    });
  }

  void onOtpFieldChanged(String value, int index) {
    if (value.isNotEmpty) {
      setState(() {
        otp[index] = value;
      });
      if (index < 3) {
        FocusScope.of(context).nextFocus(); // Move focus to next field
      } else {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).previousFocus(); // Move focus to previous field
      }
    }
  }

  void onVerify() {
    // Combine the OTP values
    String otpCode = otp.join();
    // Your OTP verification logic
    print("Entered OTP: $otpCode");
    // Add logic to verify OTP here
  }

  void onResendCode() {
    if (!isTimerActive) {
      setState(() {
        remainingSeconds = 20;
        isTimerActive = true;
      });
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColor.black, size: 18.w),
                      onPressed: () {
                        // Handle back button action
                        Navigator.pop(context);
                      },
                    ),
                    // SizedBox(width: 5.w),
                    Text(
                      "OTP VERIFICATION",
                      style: lemonMilkWithColor500(AppColor.black, 17.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              // Instructions Text
              Text(
                "Enter the verification code sent to your email address",
                style: lemonMilkWithColor500(AppColor.grey, 13.sp),
              ),
              SizedBox(height: 80.h),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return _buildOtpBox(context, index);
                }),
              ),
              Spacer(),
              // Verify Button
              SizedBox(
                width: 342.w,
                height: 55.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    onVerify();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => resetpassword()), // Replace SignUpScreen with your sign-up page
                    );
                  },
                  // onPressed: onVerify,
                  child: Text(
                    "VERIFY",
                    style: lemonMilk600(AppColor.white, 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Resend Code Text
              Center(
                child: GestureDetector(
                  onTap: onResendCode,
                  child: RichText(
                    text: TextSpan(
                      text: "RE-SEND CODE IN ",
                      style: lemonMilkWithColor500(AppColor.black2, 14.sp),
                      children: [
                        TextSpan(
                          text: isTimerActive ? "0:$remainingSeconds" : "SEND NOW",
                          style: lemonMilkWithColor700(
                              isTimerActive ? AppColor.green : AppColor.red,
                              14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget to Create OTP Input Boxes
  Widget _buildOtpBox(BuildContext context, int index) {
    return Container(
      width: 50.w,
      height: 60.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextField(
        onChanged: (value) => onOtpFieldChanged(value, index),
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: lemonMilkWithColor800(AppColor.green, 20.sp),
        decoration: InputDecoration(
          counterText: "", // Hide character counter
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.green,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
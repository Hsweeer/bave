import 'package:bon_achat/const/images.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Activeadds extends StatefulWidget {
  const Activeadds({super.key});

  @override
  State<Activeadds> createState() => _ActiveaddsState();
}

class _ActiveaddsState extends State<Activeadds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.activeadds,height: 50.h,width: 50.w,),
                ],
              ),
              SizedBox(height: 20.h,),
              Text('You have no active Ads',style: lemonMilk500(15.sp, Colors.green),)
            ],
          )
        ],
      ),

    );
  }
}

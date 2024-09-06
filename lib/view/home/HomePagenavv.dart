
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../const/svg_img.dart';
import '../../const/text_style.dart';
import '../../controllers/appbar_controller.dart';
import '../../custom_widgets/CustomBottomAppBar.dart';
import '../account/account.dart';
import '../ads/my_ads.dart';
import '../ads/post_add.dart';
import '../favourite/favourites.dart';
import 'home_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';



class HomePagenav extends StatefulWidget {
  @override
  _HomePagenavState createState() => _HomePagenavState();
}

class _HomePagenavState extends State<HomePagenav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    // PostAdScreen(),
    MyAdsPage(),
    Container(), // Placeholder for FAB, no actual page
    Favourite(), // Replace with your Favorites page
    AccountScreen(), // Replace with your Account page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
  floatingActionButton: Container(
      width: 60.w, // Adjust the size if you're using screenutil, or set fixed size
      height: 60.h, // Adjust the size if you're using screenutil
      child: FloatingActionButton(
        backgroundColor: AppColor.green,
        onPressed: () {
          // Handle FAB action
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostAdScreen(),
            ),
          );
        },
        child: Icon(Icons.add, color: AppColor.white,weight: 18.w,),
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.orange, // Border color
            width: 4.0.w,         // Border width
          ),
        ),
      ),
    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
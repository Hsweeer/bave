import 'package:bon_achat/splash/splash_screen.dart';
import 'package:bon_achat/view/Category/all_category.dart';
import 'package:bon_achat/view/Filter_choice/Filter_screen.dart';
import 'package:bon_achat/view/Filter_choice/filtered_result.dart';
import 'package:bon_achat/view/Notification_scr/notifications.dart';
import 'package:bon_achat/view/ads/ad_details.dart';
import 'package:bon_achat/view/ads/my_ads.dart';
import 'package:bon_achat/view/home/home_scr.dart';
import 'package:bon_achat/view/person_profile/person_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'const/colors.dart';
import 'custom_widgets/CustomBottomAppBar.dart';
import 'view/ads/post_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Adjust this as per your design dimensions
      builder: (context, child) {
        return GetMaterialApp(
          home:CategoriesScreen(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    // PostAdScreen(),
    MyAdsPage(),
    Container(), // Placeholder for FAB, no actual page
    MyAdsPage(), // Replace with your Favorites page
    MyAdsPage(), // Replace with your Account page
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.orange,
        onPressed: () {
          // Handle FAB action
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostAdScreen(),
          ),
        );
        },
        child: Icon(Icons.add, color: AppColor.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../custom_widgets/CustomBottomAppBar.dart';
import '../account/account.dart';
import '../ads/my_ads.dart';
import '../ads/post_add.dart';
import '../favourite/favourites.dart';
import 'home_scr.dart';

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
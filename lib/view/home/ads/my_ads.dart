import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import '../../../custom_widgets/CustomBottomAppBar.dart';


class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "MY ",
                  style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
                TextSpan(
                  text: "ADS",
                  style: TextStyle(
                    color: AppColor.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Pending Ads"),
                Tab(text: "Active Ads"),
              ],
              labelColor: AppColor.white,
              unselectedLabelColor: AppColor.black2,
              indicator: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(8.r),
              ),
              indicatorPadding: EdgeInsets.symmetric(vertical: 8.h),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("You have no pending ads.", style: TextStyle(fontSize: 18.sp))),
          _buildNoActiveAdsContent(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.orange,
        child: Icon(Icons.add, size: 32.w),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(currentIndex: 1), // Index of 'MY ADS' page
    );
  }

  Widget _buildNoActiveAdsContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.folder_open, color: AppColor.orange, size: 100.w),
        SizedBox(height: 20.h),
        Text(
          "YOU HAVE NO ACTIVE ADS",
          style: TextStyle(
            color: AppColor.green,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

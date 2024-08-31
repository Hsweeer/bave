import 'package:bon_achat/const/colors.dart';
import 'package:bon_achat/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'bottom_sheet.dart';
import 'filtered_screen.dart'; // Ensure this import points to the correct file containing FilterBottomSheet

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'COMPUTER',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view, color: AppColor.green, size: 24),
            onPressed: () {
              // Toggle grid view
            },
          ),
          IconButton(
            icon: Icon(Icons.view_list, color: Colors.grey, size: 24),
            onPressed: () {
              // Toggle list view
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _showFilterBottomSheet(context); // Call the function to show the bottom sheet
              },
              icon: Icon(Icons.tune, color:AppColor.orange, size: 18),
              label: Text(
                'FILTER',
                style: lemonMilk400(Colors.white, 14.sp)
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.green,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(width: 10),
            _buildOutlinedButton('COMPUTER'),
            SizedBox(width: 10),
            _buildLocationButton('UTTARA, DHAKA'),
          ],
        ),
      ),
    );
  }

  // Function to display the bottom sheet
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take up more space if needed
      builder: (BuildContext context) {
        return FilterBottomSheet(); // Ensure this matches the widget you created for the bottom sheet
      },
    );
  }

  Widget _buildOutlinedButton(String text) {
    return OutlinedButton(
      onPressed: () {
        // Select category
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.green),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: lemonMilk400(AppColor.black, 14.sp)
      ),
    );
  }

  Widget _buildLocationButton(String location) {
    return OutlinedButton.icon(
      onPressed: () {
        // Select location
      },
      icon: Icon(Icons.location_on, color:AppColor.orange, size: 18),
      label: Text(
        location,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.green),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}


class FilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Filter your Choice',
                  style: lemonMilk600(Colors.white, 20.sp)
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildDropdownButton('FILTER BY CATEGORIES'),
          SizedBox(height: 16),
          _buildDropdownButton('FILTER BY CITIES'),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'PRICE:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              _buildPriceField('\$00.00'),
              SizedBox(width: 10),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              _buildPriceField('\$00.00'),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
               Get.to(filtered_screen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.orange,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'APPLY FILTER',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDropdownButton(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(5, 84, 46, 1),
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceField(String text) {
    return Container(
      width: 80.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(5, 84, 46, 1),

        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

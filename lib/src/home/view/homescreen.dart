import 'package:fashion_app/src/home/widgets/categories-list.dart';
import 'package:fashion_app/src/home/widgets/custombar.dart';
import 'package:fashion_app/src/home/widgets/homeheader.dart';
import 'package:fashion_app/src/home/widgets/homeslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(110), child: CustomAppBar()),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          SizedBox(
            height: 10,
          ),
          HomeSlider(),
          SizedBox(
            height: 7,
          ),
          HomeHeader(),
          SizedBox(
            height: 15.h,
          ),
          HomeCateoriesList(),
        ],
      ),
    );
  }
}

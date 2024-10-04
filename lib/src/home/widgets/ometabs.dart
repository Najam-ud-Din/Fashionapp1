import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/tab_widget.dart';
import 'package:fashion_app/src/home/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometabs extends StatelessWidget {
  final TabController _tabController;
  const Hometabs({super.key, required TabController tabController})
      : _tabController = tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 40.w,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
            color: Kolors.kPrimary, borderRadius: BorderRadius.circular(25)),
        labelPadding: EdgeInsets.zero,
        labelColor: Kolors.kWhite,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: appStyle(20, Kolors.kPrimary, FontWeight.w600),
        unselectedLabelStyle: appStyle(20, Kolors.kGray, FontWeight.normal),
        tabs: List.generate(
            hometab.length,
            (index) => Tab(
                  child: TabWidget(
                    style: appStyle(14, Color.fromARGB(255, 191, 177, 177),
                        FontWeight.normal),
                    text: hometab[index],
                  ),
                )),
      ),
    );
  }
}

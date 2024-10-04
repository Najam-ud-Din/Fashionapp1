import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/home/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ReusableText(
                text: "Location",
                style: appStyle(15, Kolors.kGray, FontWeight.normal)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Icon(
                Ionicons.location,
                size: 14,
                color: Kolors.kPrimary,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  "Please select your location",
                  style: appStyle(13, Kolors.kPrimary, FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        NotificationWidget(),
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: GestureDetector(
            onTap: () {
              context.push("/search");
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ScreenUtil().screenWidth - 70,
                      height: 47.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            width: 0.6,
                            color: Kolors.kGrayLight,
                          )),
                      child: Row(
                        children: [
                          Icon(
                            Ionicons.search,
                            color: Kolors.kPrimary,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ReusableText(
                              text: "Search products",
                              style:
                                  appStyle(17, Kolors.kGray, FontWeight.normal))
                        ],
                      ),
                    ),
                    Container(
                      width: 42.h,
                      height: 43.h,
                      decoration: BoxDecoration(
                        color: Kolors.kPrimary,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        FontAwesome.sliders,
                        color: Kolors.kOffWhite,
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}

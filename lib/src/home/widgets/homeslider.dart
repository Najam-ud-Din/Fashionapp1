import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.25,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
                autoPlayInterval: 5000,
                isLoop: true,
                onPageChanged: (i) {
                  print(i);
                },
                indicatorColor: Kolors.kPrimaryLight,
                children: List.generate(images.length, (index) {
                  return CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    imageUrl: images[index],
                    fit: BoxFit.cover,
                  );
                })),
          ),
          Positioned(
              child: SizedBox(
            height: ScreenUtil().screenHeight * 0.20,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: AppText.kCollection,
                      style: appStyle(5, Kolors.kDark, FontWeight.w500)),
                  SizedBox(
                    height: 6,
                  ),
                  ReusableText(
                      text: "Discount 50% Off \n the every transaction",
                      style: appStyle(5, Kolors.kDark, FontWeight.w500)),
                  SizedBox(
                    height: 6,
                  ),
                  GradientBtn(
                    text: "Shop now",
                    btnWidth: 150,
                    textSize: 4,
                    btnHieght: 30,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductBottomnavigationbars extends StatelessWidget {
  final void Function()? onpressed;
  final String price;
  const ProductBottomnavigationbars(
      {super.key, required this.price, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      color: Colors.white.withOpacity(.6),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 12.w, 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
              width: 120.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ReusableText(
                        text: "Total Price",
                        style: appStyle(13, Kolors.kGray, FontWeight.w600)),
                  ),
                  ReusableText(
                      text: "\$  $price",
                      style: appStyle(14, Kolors.kDark, FontWeight.bold))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: onpressed,
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Kolors.kPrimary)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesome.shopping_bag,
                      size: 16,
                      color: Kolors.kWhite,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    ReusableText(
                        text: "CheckOut",
                        style: appStyle(14, Kolors.kWhite, FontWeight.bold))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

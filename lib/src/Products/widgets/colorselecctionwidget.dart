import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/Products/Controllers/colorsizesnotifier.dart';
import 'package:fashion_app/src/Products/Controllers/productnotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Colorselecctionwidget extends StatelessWidget {
  const Colorselecctionwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<colorsizesnotifier>(
      builder: (context, controller, child) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                context.read<productnotofier>().product!.colors.length, (i) {
              String c = context.read<productnotofier>().product!.colors[i];
              return GestureDetector(
                onTap: () {
                  controller.setcolor(c);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  margin: EdgeInsets.only(
                    right: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: controller.color == c
                        ? Kolors.kPrimary
                        : Kolors.kGrayLight,
                    borderRadius: kRadiusAll,
                  ),
                  child: Center(
                      child: Text(
                    c,
                    style: appStyle(13, Kolors.kWhite, FontWeight.normal),
                  )),
                ),
              );
            }));
      },
    );
  }
}

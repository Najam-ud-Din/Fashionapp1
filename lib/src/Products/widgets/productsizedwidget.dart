import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/Products/Controllers/colorsizesnotifier.dart';
import 'package:fashion_app/src/Products/Controllers/productnotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Productsizedwidget extends StatelessWidget {
  const Productsizedwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<colorsizesnotifier>(
      builder: (context, controller, child) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                context.read<productnotofier>().product!.sizes.length, (i) {
              String s = context.read<productnotofier>().product!.sizes[i];
              return GestureDetector(
                onTap: () {
                  controller.setsizes(s);
                },
                child: Container(
                  height: 30.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: controller.sizes == s
                        ? Kolors.kPrimary
                        : Kolors.kGrayLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    s,
                    style: appStyle(20, Kolors.kWhite, FontWeight.bold),
                  )),
                ),
              );
            }));
      },
    );
  }
}

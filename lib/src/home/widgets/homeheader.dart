import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            text: AppText.kCategory,
            style: appStyle(3, Kolors.kDark, FontWeight.w500)),
        GestureDetector(
          onTap: () {
            context.push("/categories");
          },
          child: ReusableText(
              text: AppText.kViewAll,
              style: appStyle(3, Kolors.kGray, FontWeight.w500)),
        )
      ],
    );
  }
}

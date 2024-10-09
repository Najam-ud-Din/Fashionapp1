import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: ReusableText(
            text: AppText.kPolicy,
            style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 12.h,
          ),
          ReusableText(
              text: AppText.kCancelation,
              style: appStyle(15, Kolors.kPrimary, FontWeight.w500)),
          SizedBox(
            height: 12.h,
          ),
          Text(AppText.kAppCancelationPolicy,
              textAlign: TextAlign.justify,
              style: appStyle(13, Kolors.kPrimary, FontWeight.normal)),
          SizedBox(
            height: 12.h,
          ),
          Text(AppText.kTerms,
              textAlign: TextAlign.justify,
              style: appStyle(15, Kolors.kPrimary, FontWeight.w500)),
          SizedBox(
            height: 12.h,
          ),
          Text(AppText.kAppTerms,
              textAlign: TextAlign.justify,
              style: appStyle(13, Kolors.kPrimary, FontWeight.normal)),
        ],
      ),
    );
  }
}

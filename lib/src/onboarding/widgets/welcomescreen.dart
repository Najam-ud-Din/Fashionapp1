import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelconmeScreen extends StatelessWidget {
  const WelconmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(
              height: 40.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(7, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 130,
              child: Text(
                AppText.kWelcomeMessage,
                textAlign: TextAlign.center,
                style: appStyle(4, Kolors.kGray, FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GradientBtn(
              text: AppText.kstart,
              btnWidth: 300,
              btnHieght: 40,
              radius: 10,
              textSize: 8,
              onTap: () {
                Storage().setBool('firstopen', true);
                context.go('/home');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Center(
                    child: ReusableText(
                      text: "Already have a account?",
                      style: appStyle(6, Kolors.kDark, FontWeight.normal),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: Text(
                        "Sign in",
                        style: appStyle(5, Colors.blue, FontWeight.normal),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

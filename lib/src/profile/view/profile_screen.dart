import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/help_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/Auth/view/login_screen.dart';
import 'package:fashion_app/src/profile/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? accesstoken = Storage().getString('accessToken');

    if (accesstoken == null) {
      return const LoginSceen();
    } else {
      return Scaffold(
          body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Kolors.kOffWhite,
                backgroundImage: NetworkImage(AppText.kProfilePic),
              ),
              SizedBox(
                height: 30.h,
              ),
              ReusableText(
                  text: "najamuddin9823@gmail.com",
                  style: appStyle(12, Kolors.kDark, FontWeight.w600)),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Kolors.kOffWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ReusableText(
                    text: "NajamUdDin",
                    style: appStyle(14, Kolors.kDark, FontWeight.w600)),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              color: Kolors.kOffWhite,
              child: Column(
                children: [
                  profiletilewidget(
                      ontap: () {
                        context.push('/addaddress');
                      },
                      title: "Shipping address",
                      leading: MaterialIcons.location_pin),
                  profiletilewidget(
                      ontap: () {
                        context.push('/policy');
                      },
                      title: "Privacy Policy",
                      leading: MaterialIcons.policy),
                  profiletilewidget(
                      ontap: () {
                        showHelpCenterBottomSheet(context);
                      },
                      title: "Help Center",
                      leading: AntDesign.customerservice),
                ],
              )),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                ),
                onPressed: () {},
                child: Text(
                  "LOGOUT",
                  style: appStyle(8, Colors.white, FontWeight.normal),
                )),
          ),
        ],
      ));
    }
  }
}

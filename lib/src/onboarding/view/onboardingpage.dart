import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/src/onboarding/controllers/onboarding_notofier.dart';
import 'package:fashion_app/src/onboarding/widgets/onboardingScreenone.dart';
import 'package:fashion_app/src/onboarding/widgets/onboardingScreentwo.dart';
import 'package:fashion_app/src/onboarding/widgets/welcomescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(
        initialPage: context.read<OnBoardingNotifier>().selectpage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              context.read<OnBoardingNotifier>().setSelectedPage = page;
            },
            children: [
              OnboardingScreenone(),
              OnboardingScreentwo(),
              WelconmeScreen(),
            ],
          ),
          context.read<OnBoardingNotifier>().selectpage == 2
              ? const SizedBox(
                  width: 60,
                )
              : Positioned(
                  bottom: 50.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        context.watch<OnBoardingNotifier>().selectpage == 0
                            ? SizedBox(
                                width: 20.w,
                              )
                            : GestureDetector(
                                onTap: () {
                                  if (context
                                          .read<OnBoardingNotifier>()
                                          .selectpage >
                                      0) {
                                    _pageController.animateToPage(
                                        context
                                                .read<OnBoardingNotifier>()
                                                .selectpage -
                                            1,
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeIn);
                                  }
                                },
                                child: Icon(
                                  AntDesign.leftcircle,
                                  color: Kolors.kPrimary,
                                  size: 30,
                                ),
                              ),
                        SizedBox(
                          width: 30.w,
                          height: 50.h,
                          child: PageViewDotIndicator(
                            currentItem:
                                context.watch<OnBoardingNotifier>().selectpage,
                            count: 3,
                            size: Size(10, 10),
                            unselectedSize: Size(12, 12),
                            unselectedColor: Colors.black26,
                            selectedColor: Kolors.kPrimary,
                            duration: Duration(milliseconds: 200),
                            onItemClicked: (index) {
                              _pageController.animateToPage(index,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (context.read<OnBoardingNotifier>().selectpage <
                                2) {
                              // Assuming 3 pages
                              _pageController.animateToPage(
                                  context
                                          .read<OnBoardingNotifier>()
                                          .selectpage +
                                      1,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            }
                          },
                          child: const Icon(
                            AntDesign.rightcircle,
                            color: Kolors.kPrimary,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}

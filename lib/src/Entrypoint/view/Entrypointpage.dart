import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/Entrypoint/controller/bottombarindex.dart';
import 'package:fashion_app/src/cart/view/cartpage.dart';
import 'package:fashion_app/src/home/view/homescreen.dart';
import 'package:fashion_app/src/profile/view/profile_screen.dart';
import 'package:fashion_app/src/wishlist/view/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatefulWidget {
  AppEntryPoint({super.key});

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {
  List<Widget> mylist = [
    const HomeScreen(),
    const WishlistScreen(),
    const CartPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<tabindexnotifier>(builder: (context, Tabindex, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            mylist[Tabindex.index],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data:
                      Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    backgroundColor: Kolors.kOffWhite,
                    selectedLabelStyle:
                        appStyle(12, Kolors.kPrimary, FontWeight.w500),
                    showUnselectedLabels: false,
                    selectedItemColor: Kolors.kPrimary,
                    unselectedItemColor: Kolors.kGrayLight,
                    unselectedIconTheme: IconThemeData(color: Colors.black38),
                    currentIndex: Tabindex.index,
                    onTap: (i) {
                      Tabindex.setindex(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                          label: "Home",
                          icon: Tabindex.index == 0
                              ? Icon(
                                  AntDesign.home,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                )
                              : Icon(
                                  AntDesign.home,
                                  size: 24,
                                )),
                      BottomNavigationBarItem(
                          label: "Wishlist",
                          icon: Tabindex.index == 1
                              ? Icon(
                                  Ionicons.heart,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                )
                              : Icon(
                                  Ionicons.heart_outline,
                                  size: 24,
                                )),
                      BottomNavigationBarItem(
                          label: "Cart",
                          icon: Tabindex.index == 2
                              ? Badge(
                                  label: Text("3"),
                                  child: Icon(
                                    MaterialCommunityIcons.shopping,
                                    color: Kolors.kPrimary,
                                    size: 24,
                                  ),
                                )
                              : Badge(
                                  label: Text("3"),
                                  child: Icon(
                                    MaterialCommunityIcons.shopping_outline,
                                    size: 24,
                                  ),
                                )),
                      BottomNavigationBarItem(
                          label: "Profile",
                          icon: Tabindex.index == 3
                              ? Icon(
                                  EvilIcons.user,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                )
                              : Icon(
                                  EvilIcons.user,
                                  size: 24,
                                )),
                    ],
                  )),
            )
          ],
        ),
      );
    });
  }
}

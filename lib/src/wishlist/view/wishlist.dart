import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/Products/widgets/explore_products.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: ReusableText(
                text: AppText.kWishlist,
                style: appStyle(9, Kolors.kPrimary, FontWeight.bold)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExploreProducts(),
        ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/Products/Controllers/productnotifier.dart';
import 'package:fashion_app/src/Products/widgets/colorselecctionwidget.dart';
import 'package:fashion_app/src/Products/widgets/expandedtext.dart';
import 'package:fashion_app/src/Products/widgets/product_bottomnavigationbar.dart';
import 'package:fashion_app/src/Products/widgets/productsizedwidget.dart';
import 'package:fashion_app/src/Products/widgets/similarproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class Productpage extends StatelessWidget {
  final String productID;
  const Productpage({super.key, required this.productID});

  @override
  Widget build(BuildContext context) {
    return Consumer<productnotofier>(
        builder: (context, productNotofier, child) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 300.h,
              collapsedHeight: 100.h,
              floating: false,
              pinned: true,
              leading: AppBackButton(),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Icon(
                          AntDesign.heart,
                          color: Kolors.kRed,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: SizedBox(
                  height: 400.h,
                  child: ImageSlideshow(
                      autoPlayInterval: 15000,
                      isLoop: productNotofier.product!.imageUrls.length > 1
                          ? true
                          : false,
                      onPageChanged: (i) {
                        print(i);
                      },
                      indicatorColor: Kolors.kPrimaryLight,
                      children: List.generate(
                          productNotofier.product!.imageUrls.length, (index) {
                        return CachedNetworkImage(
                          placeholder: placeholder,
                          height: 400.h,
                          errorWidget: errorWidget,
                          imageUrl: productNotofier.product!.imageUrls[index],
                          fit: BoxFit.cover,
                        );
                      })),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 10.h,
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: productNotofier.product!.clothesType.toUpperCase(),
                    style: appStyle(3, Kolors.kGray, FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        AntDesign.star,
                        color: Kolors.kGold,
                        size: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ReusableText(
                        text:
                            productNotofier.product!.ratings.toStringAsFixed(2),
                        style: appStyle(3, Kolors.kGray, FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableText(
                  text: productNotofier.product!.title,
                  style: appStyle(6, Kolors.kDark, FontWeight.w600),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Expandibletext(text: productNotofier.product!.description),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Divider(
                  thickness: 0.5.h,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                  text: "Select Sizes",
                  style: appStyle(3, Kolors.kDark, FontWeight.w600)),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Productsizedwidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                  text: "Select Color",
                  style: appStyle(3, Kolors.kDark, FontWeight.w600)),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Colorselecctionwidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                  text: "Similar Products",
                  style: appStyle(3, Kolors.kDark, FontWeight.w600)),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Similarproducts(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ProductBottomnavigationbars(
          price: productNotofier.product!.price.toStringAsFixed(2),
        ),
      );
    });
  }
}

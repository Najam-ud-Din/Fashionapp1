import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/Products/Controllers/productnotifier.dart';
import 'package:fashion_app/src/Products/models/productsmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StageredTileWidget extends StatelessWidget {
  final int i;
  final Products products;
  final void Function()? ontap;
  const StageredTileWidget(
      {super.key, required this.i, required this.products, this.ontap});

  @override
  Widget build(BuildContext context) {
    // String? accesstoken = Storage().getString('accessToken');
    return GestureDetector(
      onTap: () {
        context.read<productnotofier>().setproduct(products);
        context.push('/product/${products.id}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 400,
          color: Kolors.kOffWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: i % 2 == 0 ? 163.h : 180.h,
                color: Kolors.kPrimary,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: products.imageUrls[0],
                      height: i % 2 == 0 ? 163.h : 180.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 10.h,
                        top: 10.h,
                        child: GestureDetector(
                          onTap: ontap,
                          child: CircleAvatar(
                            backgroundColor: Kolors.kSecondaryLight,
                            child: Icon(
                              AntDesign.heart,
                              color: Kolors.kRed,
                              size: 16,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          products.title,
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(5, Kolors.kDark, FontWeight.normal),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            AntDesign.star,
                            color: Kolors.kGold,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          ReusableText(
                              text: products.ratings.toStringAsFixed(1),
                              style: appStyle(
                                  4, Kolors.kGrayLight, FontWeight.normal))
                        ],
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ReusableText(
                  text: '\$ ${products.price.toStringAsFixed(2)}',
                  style: appStyle(6, Kolors.kDark, FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

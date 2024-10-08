import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/Products/widgets/stagered_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Similarproducts extends StatelessWidget {
  const Similarproducts({super.key});

  @override
  Widget build(BuildContext context) {
    String? accesstoken = Storage().getString('accessToken');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(products.length, (index) {
            final double mainAxisCellCount = (index % 2 == 0 ? 2.45 : 2.6);
            final product = products[index];
            return StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: mainAxisCellCount,
                child: StageredTileWidget(
                  ontap: () {
                    if (accesstoken == null) {
                      loginBottomSheet(context);
                    } else {
                      // handle wishlist functionality
                    }
                  },
                  products: product,
                  i: index,
                ));
          })),
    );
  }
}

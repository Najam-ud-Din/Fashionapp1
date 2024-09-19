import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/Categories/Controllers/cateory_modifier.dart';
import 'package:fashion_app/src/Categories/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeCateoriesList extends StatelessWidget {
  const HomeCateoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SizedBox(
        height: 80.h,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(categories.length, (index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  context
                      .read<CateoryNotifier>()
                      .setCateory(category.title, category.id);
                  context.push('/category');
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Padding(
                          padding: EdgeInsets.all(4.h),
                          child: SvgPicture.network(
                            category.imageUrl,
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}

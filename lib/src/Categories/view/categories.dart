import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/Categories/Controllers/cateory_modifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: ReusableText(
            text: AppText.kCategories,
            style: appStyle(6, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, i) {
            final category = categories[i];
            return ListTile(
              onTap: () {
                context
                    .read<CateoryNotifier>()
                    .setCateory(category.title, category.id);
                context.push('/category');
              },
              leading: CircleAvatar(
                backgroundColor: Kolors.kSecondaryLight,
                radius: 18,
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SvgPicture.network(category.imageUrl),
                ),
              ),
              title: ReusableText(
                  text: category.title,
                  style: appStyle(5, Kolors.kGray, FontWeight.normal)),
              trailing: Icon(MaterialCommunityIcons.chevron_double_right),
            );
          }),
    );
  }
}

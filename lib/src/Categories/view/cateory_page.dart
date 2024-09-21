import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/Categories/Controllers/cateory_modifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cateorypage extends StatelessWidget {
  const Cateorypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: ReusableText(
          text: context.read<CateoryNotifier>().category,
          style: appStyle(10, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
    );
  }
}

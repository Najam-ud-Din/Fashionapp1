import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/logout_bottom_sheet.dart';
import 'package:fashion_app/src/Products/Controllers/productnotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Expandibletext extends StatelessWidget {
  const Expandibletext({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.justify,
          maxLines: !context.watch<productnotofier>().description ? 3 : 10,
          style: appStyle(14, Kolors.kGray, FontWeight.normal),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                context.read<productnotofier>().setdescription();
              },
              child: Text(!context.watch<productnotofier>().description
                  ? "Read more"
                  : "show less"),
            ),
          ],
        )
      ],
    );
  }
}

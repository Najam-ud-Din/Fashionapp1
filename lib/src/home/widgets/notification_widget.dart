import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString("accesstoken") == null) {
          loginBottomSheet(context);
        } else {
          context.go('/notifications');
        }
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: CircleAvatar(
          backgroundColor: Kolors.kGrayLight.withOpacity(0.3),
          child: Badge(
            label: Text("3"),
            child: Icon(
              Ionicons.notifications,
              color: Kolors.kPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

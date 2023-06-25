import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    this.onTap,
    required this.title,
    this.icon,
    this.titleFontWeight = FontWeight.bold,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final Widget? icon;
  final FontWeight? titleFontWeight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: ColorsManager.grey,
      title: Text(
        title,
        style: TextStyle(
          color: ColorsManager.primary,
          fontWeight: titleFontWeight,
        ),
      ),
      onTap: () {
        if (onTap != null) {

          Get.back();
          onTap!();
        }
      },
      leading: icon,
    );
  }
}

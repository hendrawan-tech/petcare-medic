import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  HeaderWidget({
    required this.title,
    this.backgroundColor,
  });
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor.runtimeType == Null ? whiteColor : backgroundColor,
      centerTitle: true,
      title: TextWidget(
        label: title,
        weight: "bold",
        type: "s3",
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 60);
}

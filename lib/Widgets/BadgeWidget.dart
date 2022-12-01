import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class BadgeWidget extends StatelessWidget {
  final String label;
  final Color? bgColor;
  const BadgeWidget({
    Key? key,
    required this.label,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor.runtimeType == Null ? primaryColor : bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextWidget(
        label: label,
        type: 'b2',
        color: whiteColor,
      ),
    );
  }
}

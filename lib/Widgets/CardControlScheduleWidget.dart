import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/BadgeWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class CardControlScheduleWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final Function onPress;
  const CardControlScheduleWidget({
    Key? key,
    required this.data,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(
                defaultBorderRadius,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 66,
                  height: 66,
                  margin: const EdgeInsets.only(
                    right: 14,
                  ),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      66,
                    ),
                    color: warningColor,
                  ),
                  child: ImageWidget(
                    image: data['image'],
                    height: 66,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      label: data['name'],
                      type: 's3',
                      color: fontPrimaryColor,
                      weight: 'bold',
                    ),
                    TextWidget(
                      label: data['date'],
                      type: 'b2',
                      color: fontPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            top: 10,
            child: BadgeWidget(
              label: data['time'],
            ),
          ),
        ],
      ),
    );
  }
}

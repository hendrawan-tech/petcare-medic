import 'package:flutter/material.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

import '../Utils/Themes.dart';

class CardDetailUser extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool;
  const CardDetailUser({
    super.key,
    required this.data,
    this.bool,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: borderColor,
          )),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: ImageWidget(
              image: data["image"],
              height: 66,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                ),
                child: TextWidget(
                  label: data["name"],
                  weight: "bold",
                  color: primaryColor,
                  type: "s3",
                ),
              ),
              TextWidget(
                label: data["jenis"],
                type: "b2",
              ),
              TextWidget(
                label: data["gender"],
                type: "b2",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

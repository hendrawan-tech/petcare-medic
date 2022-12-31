import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

import '../Utils/Themes.dart';

class CardDetailUser extends StatelessWidget {
  final Map<String, dynamic> data;

  const CardDetailUser({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: borderColor,
        ),
        color: whiteColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 12,
      ),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 12,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ImageWidget(
              image: getImageUrl(data['image']),
              height: 66,
              width: 66,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                label: data["name"],
                weight: "bold",
                color: primaryColor,
                type: "s3",
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                ),
                child: TextWidget(
                  label: data["species_patient"]['name'],
                  type: "b2",
                ),
              ),
              TextWidget(
                label: "${data["gender"]} / ${data["age"]} Tahun",
                type: "b2",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

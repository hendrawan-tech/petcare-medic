import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class CardMedialRecord extends StatelessWidget {
  final Map<String, dynamic> data;
  const CardMedialRecord({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 16,
          top: 18,
          child: ImageWidget(
            image: data["image"],
            height: 20,
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: TextWidget(
            label: data["tanggal"],
            weight: "medium",
            type: "l1",
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          height: 85,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
              ),
              TextWidget(
                label: data["rawat"],
                type: "b2",
                color: primaryColor,
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  TextWidget(
                    label: data["name"],
                    weight: "medium",
                  ),
                  TextWidget(
                    label: data["jenis"],
                    weight: "medium",
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              TextWidget(
                label: data["penyakit"],
                type: "b2",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

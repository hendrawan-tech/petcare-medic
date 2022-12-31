import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
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
            image: data["gender"] == 'Jantan' ? maleIcon : femaleIcon,
            height: 20,
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: TextWidget(
            label: parseMounth(
              data['medical_record']['created_at'],
            ),
            weight: "medium",
            type: "l1",
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: borderColor,
              ),
            ),
          ),
          padding: EdgeInsets.all(
            defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                label: data["medical_record"]['inpatients']['type'],
                type: "b2",
                color: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: TextWidget(
                  label:
                      "${data["patient"]['name']} - ${data['patient']["species_patient"]['name']}",
                  weight: "medium",
                ),
              ),
              TextWidget(
                label: data["medical_record"]['diagnosis'],
                type: "b2",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

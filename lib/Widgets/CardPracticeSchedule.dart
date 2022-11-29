import "package:flutter/material.dart";

import 'package:medic_petcare/Widgets/TextWidget.dart';

class CardPracticeScheduleWidget extends StatelessWidget {
  final Map<String, dynamic> test;

  const CardPracticeScheduleWidget({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      // width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffE8F9F2),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 20,
            ),
            child: Column(
              children: [
                TextWidget(
                  label: test["hari"],
                  weight: "bold",
                  type: "s3",
                ),
                SizedBox(
                  height: 12,
                ),
                TextWidget(
                  label: test["date"],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 31,
              top: 14,
            ),
            child: Column(
              children: [
                TextWidget(
                  label: "Keterangan Jadwal :",
                  type: "s3",
                  weight: "bold",
                ),
                TextWidget(
                  label: test["description"],
                  type: "b2",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

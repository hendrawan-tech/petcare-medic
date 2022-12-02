import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/BadgeWidget.dart';
import 'package:medic_petcare/Widgets/CardPracticeSchedule.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class PracticeScheduleScreen extends StatelessWidget {
  const PracticeScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(title: "Jadwal Praktik"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 260,
              color: backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 24,
                    ),
                    child: ImageWidget(
                      image: iconDokter,
                      height: 124,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 42,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          label: "Hi, Drh.Annisa !",
                          type: "s1",
                          weight: "bold",
                          color: fontPrimaryColor,
                        ),
                        TextWidget(
                          label: "Cek jadwal praktikmu\nhari ini yuk!",
                          type: "b2",
                        ),
                      ],
                    ),
                  ),
                  // BadgeWidget(
                  //   label: "Senin, 14 November 2022",
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 590,
              width: double.infinity,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 18,
                    ),
                    child: TextWidget(
                      label: "Jadwal Hari Ini",
                      weight: "medium",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(
                      defaultMargin,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: defaultMargin,
                        ),
                        child: CardPracticeScheduleWidget(
                          isi: listJadwalPraktik[index],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: TextWidget(
                      label: "Jadwal Yang Akan Datang",
                      weight: "medium",
                    ),
                  ),
                  ListView.builder(
                    itemCount: listJadwalPraktik.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(
                      defaultMargin,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: defaultMargin,
                        ),
                        child: CardPracticeScheduleWidget(
                          isi: listJadwalPraktik[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

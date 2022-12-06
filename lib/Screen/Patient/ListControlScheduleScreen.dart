import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardControlScheduleWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class ListControlSceduleScreen extends StatefulWidget {
  const ListControlSceduleScreen({Key? key}) : super(key: key);

  @override
  State<ListControlSceduleScreen> createState() => _ControlSceduleScreenState();
}

class _ControlSceduleScreenState extends State<ListControlSceduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Jadwal Kontrol",
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextWidget(
                label: "Jadwal Hari Ini",
                type: "s3",
                weight: "bold",
              ),
            ),
            ListView.builder(
              itemCount: listJadwalControl.length,
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
                  child: CardControlScheduleWidget(
                    data: listJadwalControl[index],
                    onPress: () {
                      print(
                        listJadwalControl[index],
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: TextWidget(
                label: "Jadwal yang akan datang",
                type: "s3",
                weight: "bold",
              ),
            ),
            ListView.builder(
              itemCount: listJadwalControl.length,
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
                  child: CardControlScheduleWidget(
                    data: listJadwalControl[index],
                    onPress: () {
                      print(
                        listJadwalControl[index],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

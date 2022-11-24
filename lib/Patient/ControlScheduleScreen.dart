import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardControlScheduleWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class ControlSceduleScreen extends StatefulWidget {
  const ControlSceduleScreen({Key? key}) : super(key: key);

  @override
  State<ControlSceduleScreen> createState() => _ControlSceduleScreenState();
}

class _ControlSceduleScreenState extends State<ControlSceduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Jadwal Control",
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
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

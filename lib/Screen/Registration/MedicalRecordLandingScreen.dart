import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardMedicalRecord.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class MedicalRecordLandingScreen extends StatelessWidget {
  const MedicalRecordLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Rekam Medis",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: InputWidget(
                title: "hidden",
                hintText: "Cari rekam medis . . .",
                iconLeft: Icons.search_rounded,
              ),
            ),
            ImageWidget(
              image: vetIcon,
              height: 200,
            ),
            TextWidget(
              label: "Lihat riwayat rekam medis ",
              weight: "medium",
            ),
            TextWidget(
              label: "Pasien anda secara lengkap di sini!",
              type: "b2",
              color: primaryColor,
            ),
            SizedBox(
              height: 6,
            ),
            ListView.builder(
              itemCount: listMedicalRecord.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: CardMedialRecord(
                    data: listMedicalRecord[index],
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

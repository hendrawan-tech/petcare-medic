import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardDetailUser.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Daftar Pasien",
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
                hintText: "Cari pasien . . .",
                iconLeft: Icons.search,
              ),
            ),
            ListView.builder(
              itemCount: listJadwalDetailUser.length,
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
                  child: CardDetailUser(
                    data: listJadwalDetailUser[index],
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

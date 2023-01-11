import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardMedicalRecord.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

class MedicalRecordLandingScreen extends StatefulWidget {
  const MedicalRecordLandingScreen({super.key});

  @override
  State<MedicalRecordLandingScreen> createState() =>
      _MedicalRecordLandingScreenState();
}

class _MedicalRecordLandingScreenState
    extends State<MedicalRecordLandingScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listMedicalRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Rekam Medis",
        useBackButton: false,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 24,
              ),
              child: InputWidget(
                title: "hidden",
                hintText: "Cari rekam medis . . .",
                iconLeft: Icons.search_rounded,
              ),
            ),
            Consumer<MedicalRecordProvider>(
              builder: (context, value, child) {
                return value.isLoadingMedic
                    ? CircleLoadingWidget()
                    : value.getMedicalRecord.isEmpty
                        ? EmptyWidget(
                            text: "Tidak ada data Perawatan",
                          )
                        : ListView.builder(
                            itemCount: value.getMedicalRecord.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Provider.of<MedicalRecordProvider>(
                                    context,
                                    listen: false,
                                  ).setIdInvoice(
                                    idInvoice: value.getMedicalRecord[index]
                                            ['medical_record']['inpatients']
                                            ['invoice']['id']
                                        .toString(),
                                  );
                                  Provider.of<MedicalRecordProvider>(
                                    context,
                                    listen: false,
                                  ).itemMedicalRecord(
                                    data: value.getMedicalRecord[index]
                                        ['medical_record']['inpatients'],
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    Routes.medicalRecordScreen,
                                  );
                                },
                                child: CardMedialRecord(
                                  data: value.getMedicalRecord[index],
                                ),
                              );
                            },
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}

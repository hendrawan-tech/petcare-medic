import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardControlScheduleWidget.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class ListControlSceduleScreen extends StatefulWidget {
  const ListControlSceduleScreen({Key? key}) : super(key: key);

  @override
  State<ListControlSceduleScreen> createState() => _ControlSceduleScreenState();
}

class _ControlSceduleScreenState extends State<ListControlSceduleScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listPatientControlSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Jadwal Kontrol",
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Consumer<MedicalRecordProvider>(
              builder: (context, value, child) {
                return value.isLoadingMedic
                    ? CircleLoadingWidget()
                    : value.getPatientMedicalRecord.isEmpty
                        ? EmptyWidget(
                            text: "Tidak ada data Jadwal Kontrol",
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                label: "Jadwal yang akan datang",
                                type: "s3",
                                weight: "bold",
                                color: fontPrimaryColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListView.builder(
                                itemCount: value.getPatientMedicalRecord.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (value.getPatientMedicalRecord[index]
                                              ['medical_record']['inpatients']
                                          ['type'] ==
                                      'Rawat Jalan') {
                                    return CardControlScheduleWidget(
                                      data:
                                          value.getPatientMedicalRecord[index],
                                      onPress: () {},
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}

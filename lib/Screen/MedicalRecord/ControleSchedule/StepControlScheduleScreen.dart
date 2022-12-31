import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/BadgeWidget.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class StepControlScheduleScreen extends StatefulWidget {
  const StepControlScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StepControlScheduleScreen> createState() =>
      _StepControlScheduleScreenState();
}

class _StepControlScheduleScreenState extends State<StepControlScheduleScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listControlSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.stepAddControlSchedule,
          );
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 24,
          ),
          padding: EdgeInsets.all(
            defaultMargin,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            color: whiteColor,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                label: "Daftar Jadwal Kontrol",
                weight: 'bold',
                type: 's3',
                color: fontPrimaryColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Consumer<MedicalRecordProvider>(
                builder: (context, value, child) {
                  return value.isLoadingControlSchedule
                      ? CircleLoadingWidget()
                      : value.gettControlSchedule.isEmpty
                          ? EmptyWidget(text: "Tidak ada data Jadwal Kontrol")
                          : ListView.builder(
                              itemCount: value.gettControlSchedule.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CardControlSchedule(
                                  data: value.gettControlSchedule[index],
                                );
                              },
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardControlSchedule extends StatelessWidget {
  final Map data;
  const CardControlSchedule({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      margin: const EdgeInsets.only(
        top: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                label: "Keterangan",
                color: fontPrimaryColor,
                weight: 'bold',
              ),
              BadgeWidget(
                label: parseMounth(
                  data['date_control'],
                ),
              ),
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
          TextWidget(
            label: data['description'],
            color: fontSecondaryColor,
          ),
        ],
      ),
    );
  }
}

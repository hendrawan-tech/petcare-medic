import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class StepPrescriptionScreen extends StatefulWidget {
  const StepPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<StepPrescriptionScreen> createState() => _StepPrescriptionScreenState();
}

class _StepPrescriptionScreenState extends State<StepPrescriptionScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listPrescription();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.addPrescriptionScreen,
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
                label: "Daftar Resep Obat",
                weight: 'bold',
                type: 's3',
                color: fontPrimaryColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Consumer<MedicalRecordProvider>(
                builder: (context, value, child) {
                  return value.isLoadingPrescription
                      ? CircleLoadingWidget()
                      : value.getPrescription.isEmpty
                          ? EmptyWidget(text: "Tidak ada data Resep Obat")
                          : ListView.builder(
                              itemCount: value.getPrescription.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CardPrescription(
                                  data: value.getPrescription[index],
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

class CardPrescription extends StatelessWidget {
  final Map data;
  const CardPrescription({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: [
          ImageWidget(
            image: data['product']['image'] != null
                ? getImageUrl(data['product']['image'])
                : treatmentIcon,
            width: 60,
            height: 60,
          ),
          SizedBox(
            width: defaultMargin,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                label: data['product']['name'],
                weight: 'bold',
                color: fontPrimaryColor,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: formatPrice(
                      amount: data['product']['price'],
                    ),
                    color: priceColor,
                    type: 'b2',
                    weight: 'medium',
                  ),
                  TextWidget(
                    label: " (${data['quantity']}x)",
                    color: fontSecondaryColor,
                    type: 'b2',
                    weight: 'medium',
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              TextWidget(
                label: data['description'],
                color: fontSecondaryColor,
                type: 'l1',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

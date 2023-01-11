import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class StepReviewScreen extends StatefulWidget {
  const StepReviewScreen({Key? key}) : super(key: key);

  @override
  State<StepReviewScreen> createState() => _StepReviewScreenState();
}

class _StepReviewScreenState extends State<StepReviewScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listTreatment();
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listPrescription();
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).dataInvoice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Consumer<MedicalRecordProvider>(
                builder: (context, value, child) {
                  var listData = value.getTreatment;
                  return value.isLoadingTreatment
                      ? CircleLoadingWidget()
                      : listData.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  label: "Perawatan",
                                  weight: 'bold',
                                  type: 's3',
                                  color: fontPrimaryColor,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ListView.builder(
                                  itemCount: listData.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = listData[index];
                                    return TextTileWidget(
                                      label: data['description'],
                                      value: formatPrice(
                                        amount: data['price'],
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                              ],
                            )
                          : Container();
                },
              ),
              Consumer<MedicalRecordProvider>(
                builder: (context, value, child) {
                  var listData = value.getPrescription;
                  return value.isLoadingPrescription
                      ? CircleLoadingWidget()
                      : listData.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  label: "Resep Obat",
                                  weight: 'bold',
                                  type: 's3',
                                  color: fontPrimaryColor,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ListView.builder(
                                  itemCount: listData.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = listData[index];
                                    return TextTileWidget(
                                      label:
                                          "${data['product']['name']} (${data['quantity']}x)",
                                      value: formatPrice(
                                        amount: data['product']['price'],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Container();
                },
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 24,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      label: "Total",
                      weight: 'bold',
                      type: 's3',
                      color: fontPrimaryColor,
                    ),
                    Consumer<MedicalRecordProvider>(
                      builder: (context, value, child) {
                        return TextWidget(
                          label: value.isLoadingInvoice
                              ? 'Loading . . .'
                              : formatPrice(
                                  amount: value.getInvoice['total'].toString(),
                                ),
                          weight: 'bold',
                          type: 's3',
                          color: fontPrimaryColor,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextTileWidget extends StatelessWidget {
  final String label, value;
  const TextTileWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextWidget(
              label: label,
              color: fontSecondaryColor,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          TextWidget(
            label: value,
            color: fontPrimaryColor,
            weight: 'medium',
          ),
        ],
      ),
    );
  }
}

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

class StepCareScreen extends StatefulWidget {
  const StepCareScreen({Key? key}) : super(key: key);

  @override
  State<StepCareScreen> createState() => _StepCareScreenState();
}

class _StepCareScreenState extends State<StepCareScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listTreatment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.formAddCareScreen,
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
                label: "Daftar Perawatan",
                weight: 'bold',
                type: 's3',
                color: fontPrimaryColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Consumer<MedicalRecordProvider>(
                builder: (context, value, child) {
                  return value.isLoadingTreatment
                      ? CircleLoadingWidget()
                      : value.getTreatment.isEmpty
                          ? const EmptyWidget(text: "Tidak ada data Perawatan")
                          : ListView.builder(
                              itemCount: value.getTreatment.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CardTreatment(
                                  data: value.getTreatment[index],
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

class CardTreatment extends StatelessWidget {
  final Map data;
  const CardTreatment({
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
            image: data['photo'] != null
                ? getImageUrl(data['photo'])
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
                label: data['description'],
                weight: 'bold',
                color: fontPrimaryColor,
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                label: formatPrice(
                  amount: data['price'],
                ),
                color: priceColor,
                type: 'b2',
                weight: 'medium',
              ),
              const SizedBox(
                height: 6,
              ),
              TextWidget(
                label: parseMounth(
                  data['created_at'],
                ),
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

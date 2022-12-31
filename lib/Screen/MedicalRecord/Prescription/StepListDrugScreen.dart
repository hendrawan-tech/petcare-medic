import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class StepListDrugScreen extends StatefulWidget {
  const StepListDrugScreen({Key? key}) : super(key: key);

  @override
  State<StepListDrugScreen> createState() => _StepListDrugScreenState();
}

class _StepListDrugScreenState extends State<StepListDrugScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  List selectedIndex = [];
  List<Map<String, dynamic>> selectedData = [];

  getData() {
    Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).listDrug();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Daftar Obat",
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputWidget(
                    title: "hidden",
                    hintText: "Pencarian....",
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Consumer<MedicalRecordProvider>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? CircleLoadingWidget()
                          : value.getDrug.isEmpty
                              ? EmptyWidget(text: "Tidak ada data Obat")
                              : ListView.builder(
                                  itemCount: value.getDrug.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (selectedIndex.contains(index)) {
                                          setState(() {
                                            selectedIndex.remove(index);
                                            selectedData.remove(
                                              value.getDrug[index],
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            selectedIndex.add(index);
                                            selectedData.add(
                                              value.getDrug[index],
                                            );
                                          });
                                        }
                                      },
                                      child: CardDrug(
                                        data: value.getDrug[index],
                                        active: selectedIndex.contains(index)
                                            ? true
                                            : false,
                                      ),
                                    );
                                  },
                                );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: borderColor,
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: ButtonWidget(
              customHeight: 48,
              title: "Tambah",
              onPressed: () {
                Provider.of<MedicalRecordProvider>(
                  context,
                  listen: false,
                ).tempDrug(
                  data: selectedData,
                );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  Routes.addPrescriptionScreen,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardDrug extends StatelessWidget {
  final Map data;
  final bool active;
  const CardDrug({
    Key? key,
    required this.data,
    required this.active,
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
            image: data['image'] != null
                ? getImageUrl(data['image'])
                : treatmentIcon,
            width: 60,
            height: 60,
          ),
          SizedBox(
            width: defaultMargin,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  label: data['name'],
                  weight: 'bold',
                  color: fontPrimaryColor,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  label: "Stok ${data['stock']}",
                  color: fontSecondaryColor,
                  type: 'l1',
                ),
                const SizedBox(
                  height: 6,
                ),
                TextWidget(
                  label: formatPrice(amount: data['price']),
                  color: priceColor,
                  type: 'b2',
                  weight: 'medium',
                ),
              ],
            ),
          ),
          Icon(
            active ? Icons.check_box : Icons.check_box_outline_blank_rounded,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

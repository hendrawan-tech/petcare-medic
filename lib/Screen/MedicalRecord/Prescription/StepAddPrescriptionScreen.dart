import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Snackbar.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class StepAddPrescriptionScreen extends StatefulWidget {
  const StepAddPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<StepAddPrescriptionScreen> createState() =>
      _StepAddPrescriptionScreenState();
}

class _StepAddPrescriptionScreenState extends State<StepAddPrescriptionScreen> {
  List listData = [];
  bool err = false, isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var data = Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).getTmpDrug;
    for (var item in data) {
      listData.add({
        ...item,
        "quantity": '1',
        "description": "",
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Resep Obat",
        rightWidget: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.stepListDrugScreen,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(
                10,
              ),
              margin: EdgeInsets.only(
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Icon(
                Icons.add,
                color: whiteColor,
                size: 20,
              ),
            ),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                      label: "Resep Obat",
                      weight: 'bold',
                      type: 's3',
                      color: fontPrimaryColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    listData.isEmpty
                        ? const EmptyWidget(text: "Tidak ada data Obat")
                        : ListView.builder(
                            itemCount: listData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data = listData[index];
                              return CardDrug(
                                data: data,
                                onChanged: (data) {
                                  setState(() {
                                    listData[index] = data;
                                  });
                                },
                              );
                            },
                          ),
                    err
                        ? Container(
                            padding: const EdgeInsets.all(
                              16,
                            ),
                            margin: const EdgeInsets.only(
                              top: 8,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: redColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextWidget(
                              label: "Tidak boleh ada keterangan yang kosong",
                              color: redColor,
                              weight: 'bold',
                              type: 'l1',
                            ),
                          )
                        : Container(),
                  ],
                ),
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
              title: "Lanjutkan",
              theme: isLoading ? 'disable' : 'primary',
              isLoading: isLoading,
              onPressed: () async {
                for (var item in listData) {
                  if (item['description'] == "") {
                    setState(() {
                      err = true;
                    });
                  } else {
                    setState(() {
                      err = false;
                    });
                  }
                }
                if (!err) {
                  setState(() {
                    isLoading = true;
                  });
                  Provider.of<MedicalRecordProvider>(
                    context,
                    listen: false,
                  )
                      .addDrug(
                    data: listData,
                  )
                      .then(
                    (value) {
                      setState(() {
                        isLoading = false;
                      });
                      if (value['meta']['code'] == 200) {
                        Navigator.pop(context);
                        Provider.of<MedicalRecordProvider>(
                          context,
                          listen: false,
                        ).clearTempDrug();
                        Provider.of<MedicalRecordProvider>(
                          context,
                          listen: false,
                        ).listPrescription();
                      } else {
                        setState(() {
                          showSnackBar(
                            context,
                            value["meta"]['message'],
                            type: 'error',
                            position: 'TOP',
                            duration: 1,
                          );
                        });
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardDrug extends StatefulWidget {
  final Map data;
  final void Function(Map) onChanged;
  const CardDrug({
    Key? key,
    required this.data,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CardDrug> createState() => _CardDrugState();
}

class _CardDrugState extends State<CardDrug> {
  TextEditingController descController = TextEditingController();
  int qty = 1;

  onChangeQty(String qty) {
    setState(() {
      widget.data['quantity'] = qty;
    });
  }

  onChangeDesc(String desc) {
    setState(() {
      widget.data['description'] = descController.text;
    });
  }

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
      child: Column(
        children: [
          Row(
            children: [
              ImageWidget(
                image: widget.data['image'] != null
                    ? getImageUrl(widget.data['image'])
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
                      label: widget.data['name'],
                      weight: 'bold',
                      color: fontPrimaryColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextWidget(
                      label: "Stok ${widget.data['stock']}",
                      color: fontSecondaryColor,
                      type: 'l1',
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          label: formatPrice(
                            amount: "${int.parse(widget.data['price']) * qty}",
                          ),
                          color: priceColor,
                          type: 'b2',
                          weight: 'medium',
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (qty > 1) {
                                  setState(() {
                                    qty -= 1;
                                  });
                                  onChangeQty(qty.toString());
                                }
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                color:
                                    qty > 1 ? primaryColor : fontSecondaryColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultMargin,
                              ),
                              child: TextWidget(
                                label: qty.toString(),
                                color: fontPrimaryColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (qty < int.parse(widget.data['stock'])) {
                                  setState(() {
                                    qty += 1;
                                  });
                                  onChangeQty(qty.toString());
                                }
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                color: qty < int.parse(widget.data['stock'])
                                    ? primaryColor
                                    : fontSecondaryColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          InputWidget(
            title: "Keterangan",
            controller: descController,
            onChanged: onChangeDesc,
            hintText: "Contoh : 1x Sehari",
          ),
        ],
      ),
    );
  }
}

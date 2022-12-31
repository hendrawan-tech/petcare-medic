import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Utils/Snackbar.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/ModalOptionWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class MedicalRecordScreen extends StatefulWidget {
  const MedicalRecordScreen({Key? key}) : super(key: key);

  @override
  State<MedicalRecordScreen> createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  int selectedIndex = 0;
  bool isLoading = false;
  List categories = [];

  Widget switchScreen(screen) {
    return screen;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var data = Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).getItemMedicalRecord;
    if (data['type'] == "Rawat Inap") {
      setState(() {
        categories = categoryRawatInap;
      });
    } else if (data['type'] == "Rawat Jalan") {
      setState(() {
        categories = categoryRawatJalan;
      });
    } else {
      setState(() {
        categories = categoryPulang;
      });
    }
  }

  modalConfirm() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ModalOptionWidget(
          title: "Konfirmasi",
          subtitle:
              "Apakah anda yakin pemeriksaan sudah selesai?\nJika Iya maka data yang sudah tersimpan tidak bisa diubah lagi!",
          titleButtonTop: 'Iya',
          titleButtonBottom: 'Tidak',
          onPressButtonTop: () async {
            setState(() {
              isLoading = true;
            });
            Provider.of<MedicalRecordProvider>(
              context,
              listen: false,
            ).updateMedic().then((value) {
              setState(() {
                isLoading = false;
              });
              if (value['meta']['code'] == 200) {
                Navigator.pop(
                  context,
                );
                Navigator.pop(
                  context,
                );
                Provider.of<MedicalRecordProvider>(
                  context,
                  listen: false,
                ).listMedicalRecord();
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
            });
          },
          onPressButtonBottom: () {
            Navigator.pop(context);
          },
          imageTopHeight: 125,
          textAlign: TextAlign.left,
          axisText: CrossAxisAlignment.start,
          alignmentText: Alignment.centerLeft,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    ).getItemMedicalRecord;
    return Scaffold(
      appBar: HeaderWidget(
        title: data['type'],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border(
                bottom: BorderSide(
                  color: borderColor,
                ),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: defaultMargin,
            ),
            child: AlignedGridView.count(
              crossAxisCount: 3,
              itemCount: categories.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: defaultMargin,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      ImageWidget(
                        image: selectedIndex == index
                            ? categories[index]['activeIcon']
                            : categories[index]['icon'],
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                        label: categories[index]['label'],
                        type: 'b2',
                        weight: selectedIndex == index ? 'bold' : 'medium',
                        color: selectedIndex == index
                            ? primaryColor
                            : fontPrimaryColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: switchScreen(
              categories[selectedIndex]['screen'],
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
              onPressed: () {
                if (selectedIndex < (categories.length - 1)) {
                  setState(() {
                    selectedIndex += 1;
                  });
                } else {
                  modalConfirm();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class MedicalRecordScreen extends StatefulWidget {
  const MedicalRecordScreen({Key? key}) : super(key: key);

  @override
  State<MedicalRecordScreen> createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  int selectedIndex = 0;

  Widget switchScreen(screen) {
    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Rawat Inap",
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
              itemCount: categoryRawatInap.length,
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
                            ? categoryRawatInap[index]['activeIcon']
                            : categoryRawatInap[index]['icon'],
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                        label: categoryRawatInap[index]['label'],
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
              categoryRawatInap[selectedIndex]['screen'],
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
                setState(() {
                  selectedIndex += 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

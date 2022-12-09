import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardListReportScreen.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class ListReportScreen extends StatelessWidget {
  const ListReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Laporan ",
        fontWeight: "bold",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: primaryColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                            defaultMargin,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                label: "Pilih tanggal",
                                color: whiteColor,
                                weight: 'medium',
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_today_rounded),
                                  Expanded(
                                    child: InputWidget(
                                      title: "Dari",
                                      hintText: "hintText",
                                      inputHeight: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Icon(Icons.calendar_today_rounded),
                                  Flexible(
                                    child: InputWidget(
                                      title: "Sampai",
                                      hintText: "hintText",
                                      inputHeight: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 20,
                  bottom: 0,
                  child: ImageWidget(
                    image: paternImage,
                    width: 185,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: listRawatInap.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: CardListReportScreen(
                    data: listRawatInap[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/BadgeWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class DetailControlScheduleScreen extends StatelessWidget {
  const DetailControlScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(title: "Jadwal Kontrol"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: gradientColor3),
                  ),
                ),
                Positioned.fill(
                  top: 28,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: ImageWidget(
                            image:
                                "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          label: "Chiyoo",
                          color: whiteColor,
                          weight: "bold",
                          type: "s1",
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        TextWidget(
                          label: "Kucing Alaska",
                          color: whiteColor,
                          type: "b2",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 26),
              child: TextWidget(
                label: "Rekam Medis",
                weight: "bold",
                type: "s3",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: borderColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 58,
                              left: 10,
                            ),
                            child: TextWidget(
                              label: "Anamnesa",
                              weight: "medium",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 4,
                            ),
                            child: TextWidget(
                              label:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard ",
                              type: "b2",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                            ),
                            child: TextWidget(
                              label: "Pemeriksaan",
                              color: whiteColor,
                              type: "s3",
                              weight: "bold",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: BadgeWidget(
                              label: "Sen, 20 Juni 2022",
                              // bgColor: primaryColor.withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: borderColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 58,
                              left: 10,
                            ),
                            child: TextWidget(
                              label: "Anamnesa",
                              weight: "medium",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 4,
                            ),
                            child: TextWidget(
                              label:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard ",
                              type: "b2",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                            ),
                            child: TextWidget(
                              label: "Pemeriksaan",
                              color: whiteColor,
                              type: "s3",
                              weight: "bold",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: BadgeWidget(label: "Sen, 20 Juni 2022"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

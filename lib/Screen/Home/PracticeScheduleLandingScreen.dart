import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/PracticeScheduleProvider.dart';
import 'package:medic_petcare/Provider/UserProvider.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardPracticeSchedule.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/ShimmerWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class PracticeScheduleLandingScreen extends StatefulWidget {
  const PracticeScheduleLandingScreen({super.key});

  @override
  State<PracticeScheduleLandingScreen> createState() =>
      _PracticeScheduleLandingScreenState();
}

class _PracticeScheduleLandingScreenState
    extends State<PracticeScheduleLandingScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    Provider.of<PracticeScheduleProvider>(
      context,
      listen: false,
    ).getShcedule();
  }

  List<Color> colors = [
    Colors.green,
    Colors.purple,
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.amber,
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Jadwal Praktik",
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<UserProvider>(
              builder: (context, value, child) {
                var user = value.getUserData;
                return Container(
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: 24,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 14,
                        ),
                        child: ImageWidget(
                          image: dokterIcon,
                          height: 124,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              label: "Hi, ${user['name']}",
                              type: "s1",
                              weight: "bold",
                              color: fontPrimaryColor,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextWidget(
                              label: "Cek jadwal praktikmu\nhari ini yuk!",
                              type: "b2",
                              color: fontGreyColor2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Consumer<PracticeScheduleProvider>(
              builder: (context, value, child) {
                var schedule = value.getSchedule;
                var nowSchedule = value.getNowSchedule;
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: borderColor,
                        offset: const Offset(0, -1), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      value.isLoading
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ShimmeerWidget(
                                  width: 170,
                                  height: 20,
                                ),
                                const LoadingPracticeSchedule(),
                                SizedBox(
                                  height: defaultMargin,
                                ),
                                const ShimmeerWidget(
                                  width: 200,
                                  height: 20,
                                ),
                                ListView.builder(
                                  itemCount: 6,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return const LoadingPracticeSchedule();
                                  },
                                ),
                              ],
                            )
                          : nowSchedule.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      label: "Jadwal Hari Ini",
                                      type: 's3',
                                      weight: "bold",
                                      color: fontPrimaryColor,
                                    ),
                                    CardPracticeScheduleWidget(
                                      data: nowSchedule,
                                      color:
                                          colors[random.nextInt(colors.length)],
                                    ),
                                    SizedBox(
                                      height: defaultMargin,
                                    ),
                                  ],
                                )
                              : Container(),
                      schedule.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  label: "Jadwal Yang Akan Datang",
                                  type: 's3',
                                  weight: "bold",
                                  color: fontPrimaryColor,
                                ),
                                ListView.builder(
                                  itemCount: schedule.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CardPracticeScheduleWidget(
                                      data: schedule[index],
                                      color:
                                          colors[random.nextInt(colors.length)],
                                    );
                                  },
                                ),
                              ],
                            )
                          : Container(),
                    ],
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

import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardControlScheduleWidget.dart';
import 'package:medic_petcare/Widgets/CardDetailUser.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "User List",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 196,
              color: backgroundColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Container(
                      width: 86,
                      height: 78,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: ImageWidget(
                        image: userIcon,
                        width: 86,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        label: "Slamet Nurdin",
                        weight: "bold",
                        type: "s1",
                      ),
                      TextWidget(
                        label: "slamet@gmail.com",
                        type: "b2",
                      ),
                      TextWidget(
                        label: "08239489202",
                        type: "b2",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 574,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(
                  38,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 24,
                        ),
                        child: TextWidget(
                          label: "Daftar Hewan",
                          type: "s3",
                          weight: "bold",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          top: 24,
                        ),
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffE8F9F2),
                          ),
                          child: Icon(
                            Icons.add_circle_outline_sharp,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ListView.builder(
                    itemCount: listJadwalDetailUser.length,
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
                        child: CardDetailUser(
                          data: listJadwalDetailUser[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

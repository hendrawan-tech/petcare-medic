import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Widgets/BadgeWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  bgHeader,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: ImageWidget(
                          image: iconDokter,
                        ),
                      ),
                      ImageWidget(
                        image: notifIcon,
                        width: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  TextWidget(
                    label: "Welcome",
                    type: 'b2',
                    color: fontSecondaryColor,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextWidget(
                    label: "Drh. Annisa",
                    type: 's2',
                    weight: 'bold',
                    color: fontPrimaryColor,
                  ),
                  const CardSchedule(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      bottom: defaultMargin,
                    ),
                    child: TextWidget(
                      label: "What do you need?",
                      type: 's3',
                      weight: 'bold',
                      color: fontPrimaryColor,
                    ),
                  ),
                  AlignedGridView.count(
                    crossAxisCount: 4,
                    itemCount: listFeatures.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: defaultMargin,
                    crossAxisSpacing: defaultMargin,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            listFeatures[index]['onpress'],
                          );
                        },
                        child: Column(
                          children: [
                            ImageWidget(
                              image: listFeatures[index]['icon'],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              label: listFeatures[index]['label'],
                              type: 'l1',
                              weight: 'medium',
                              textAlign: TextAlign.center,
                              color: fontPrimaryColor,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      bottom: defaultMargin,
                    ),
                    child: TextWidget(
                      label: "Antrian Saat Ini",
                      type: 's3',
                      weight: 'bold',
                      color: fontPrimaryColor,
                    ),
                  ),
                  CardQueue(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardQueue extends StatelessWidget {
  const CardQueue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BadgeWidget(
                label: "07 Agustus 2022",
                customPadding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 12,
                ),
                customRadius: 15,
                typeFont: 'l1',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 4,
                ),
                child: TextWidget(
                  label: "Angga Candra",
                  type: 's3',
                  weight: 'bold',
                  color: fontPrimaryColor,
                ),
              ),
              TextWidget(
                label: "Kucing Garong",
                type: 'b2',
                color: fontPrimaryColor,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(
              24,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(
                .10,
              ),
            ),
            child: TextWidget(
              label: "1",
              type: 's1',
              color: fontPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CardSchedule extends StatelessWidget {
  const CardSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 36,
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
                        label: "Cek jadwal praktik anda hari ini!",
                        color: whiteColor,
                        type: 's3',
                        weight: 'bold',
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      Row(
                        children: [
                          TextWidget(
                            label: "Pelajari Selengkapnya",
                            color: whiteColor,
                            type: 'b2',
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: whiteColor,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: defaultMargin + 4,
                ),
                child: ImageWidget(
                  image: dogIcon,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top: 50,
          bottom: 0,
          child: ImageWidget(
            image: paternImage,
            width: 185,
          ),
        ),
        Positioned(
          right: 16,
          top: 26,
          child: ImageWidget(
            image: dogIcon,
            width: 110,
          ),
        ),
      ],
    );
  }
}

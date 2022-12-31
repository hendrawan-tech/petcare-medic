import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medic_petcare/Config/Network.dart';
import 'package:medic_petcare/Provider/ArticleProvider.dart';
import 'package:medic_petcare/Provider/RegistrationProvider.dart';
import 'package:medic_petcare/Provider/UserProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ArticleCardWidget.dart';
import 'package:medic_petcare/Widgets/BadgeWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    Provider.of<ArticleProvider>(
      context,
      listen: false,
    ).article();
    Provider.of<RegistrationProvider>(
      context,
      listen: false,
    ).listRegistration(
      limit: '3',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileSection(),
                  const CardSchedule(),
                  const SizedBox(
                    height: 32,
                  ),
                  AlignedGridView.count(
                    crossAxisCount: 4,
                    itemCount: listFeatures.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: defaultMargin,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
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
                  Consumer<RegistrationProvider>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? CircleLoadingWidget()
                          : value.getRegistration.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 24,
                                        bottom: defaultMargin,
                                        left: defaultMargin,
                                        right: defaultMargin,
                                      ),
                                      child: TextWidget(
                                        label: "Antrian Saat Ini",
                                        type: 's3',
                                        weight: 'bold',
                                        color: fontPrimaryColor,
                                      ),
                                    ),
                                    ListView.builder(
                                      itemCount: value.getRegistration.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Provider.of<RegistrationProvider>(
                                              context,
                                              listen: false,
                                            ).setItemRegistration(
                                              data:
                                                  value.getRegistration[index],
                                            );
                                            Navigator.pushNamed(
                                              context,
                                              Routes.medicalRecordFormScreen,
                                            );
                                          },
                                          child: CardQueue(
                                            data: value.getRegistration[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : Container();
                    },
                  ),
                  Consumer<ArticleProvider>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? CircleLoadingWidget()
                          : value.getArticle.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 24,
                                        bottom: defaultMargin,
                                        left: defaultMargin,
                                        right: defaultMargin,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            label: "Artikel Menarik",
                                            type: 's3',
                                            weight: 'bold',
                                            color: fontPrimaryColor,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                Routes.articleListScreen,
                                              );
                                            },
                                            child: TextWidget(
                                              label: "Lihat Semua",
                                              weight: 'bold',
                                              type: 'b2',
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      margin: const EdgeInsets.only(
                                        bottom: 24,
                                      ),
                                      child: ListView.builder(
                                        itemCount: value.getArticle.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(
                                          left: defaultMargin,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return ArticleCardWidget(
                                            data: value.getArticle[index],
                                            isHorizontal: true,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : Container();
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

class CardQueue extends StatelessWidget {
  final Map data;
  const CardQueue({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: 12,
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
              BadgeWidget(
                label: parseMounth(data['date_regis']),
                customPadding: const EdgeInsets.symmetric(
                  vertical: 4,
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
                  label: data['patient']['user']['name'],
                  type: 's3',
                  weight: 'bold',
                  color: fontPrimaryColor,
                ),
              ),
              TextWidget(
                label: data['patient']['name'],
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
              label: data['urutan'],
              type: 's1',
              color: fontPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        var user = value.getUserData;
        return Padding(
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
                      image: "${Network().photoUrl}${user['avatar']}",
                      width: double.infinity,
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
                label: "Selamat Datang,",
                type: 'b2',
                color: fontSecondaryColor,
              ),
              const SizedBox(
                height: 2,
              ),
              TextWidget(
                label: user['name'],
                type: 's2',
                weight: 'bold',
                color: fontPrimaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CardSchedule extends StatelessWidget {
  const CardSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.practiceScheduleLandingScreen,
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 36,
              left: defaultMargin,
              right: defaultMargin,
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
                  padding: const EdgeInsets.only(
                    right: 4,
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
      ),
    );
  }
}

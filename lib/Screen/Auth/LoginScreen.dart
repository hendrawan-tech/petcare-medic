import 'package:flutter/material.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 292,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageWidget(
                image: backgroundLogin,
                width: double.infinity,
              ),
            ),
            backgroundColor: whiteColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(
                0.0,
              ),
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 32),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                      25,
                    ),
                  ),
                  color: whiteColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 32),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    25,
                  ),
                ),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  ImageWidget(
                    image: logoBlack,
                    width: 125,
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  TextWidget(
                    label: "Bontang Petcare",
                    type: 's1',
                    color: fontPrimaryColor,
                    weight: 'bold',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InputWidget(
                    title: "Email",
                    hintText: "Masukkan Alamat Email",
                  ),
                  InputWidget(
                    title: "Password",
                    hintText: "Masukkan Password",
                    obscure: true,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 24,
                    ),
                    width: double.infinity,
                    child: ButtonWidget(
                      title: "Masuk",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.homeScreen,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

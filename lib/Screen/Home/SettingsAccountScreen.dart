import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class SettingsAccountScreen extends StatefulWidget {
  const SettingsAccountScreen({super.key});

  @override
  State<SettingsAccountScreen> createState() => _SettingsAccountState();
}

class _SettingsAccountState extends State<SettingsAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Settings Account",
      ),
      body: Column(
        children: [
          Center(
            heightFactor: 1.5,
            child: Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.red,
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
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 14,
            ),
            child: Row(
              children: [
                ImageWidget(
                  image: iconUser,
                  height: 24,
                ),
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: InputWidget(
                    title: "Nama",
                    hintText: "Annisa Siti",
                    enable: false,
                  ),
                ),
                ImageWidget(
                  image: pencil,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 14,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.mail_outline,
                  size: 24,
                ),
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: InputWidget(
                    title: "E-mail",
                    hintText: "Annisa@gmail.com",
                    enable: false,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 14,
            ),
            child: Row(
              children: [
                ImageWidget(
                  image: cellphoneIcon,
                  height: 24,
                ),
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: InputWidget(
                    title: "Nomor Telepon",
                    hintText: "08293293220",
                    enable: false,
                  ),
                ),
                ImageWidget(
                  image: pencil,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 14,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 24,
                ),
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: InputWidget(
                    title: "Nomor STR",
                    hintText: "88422021",
                    enable: false,
                  ),
                ),
                ImageWidget(
                  image: pencil,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 110,
          ),
          SizedBox(
            width: 214,
            child: ButtonWidget(
              title: "Simpan",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

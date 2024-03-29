import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: ImageWidget(
                    image: iconUser,
                    height: 22,
                  ),
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: "Name",
                  ),
                  TextWidget(
                    label: "Annisa Siti",
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: ImageWidget(
                  image: pencil,
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail_outline,
                ),
                labelText: "E-mail",
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.app_registration,
                    color: primaryColor,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.phone_enabled_outlined,
                ),
                labelText: "Number Telephone",
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.app_registration,
                    color: primaryColor,
                  ),
                ),
                suffixIconColor: primaryColor,
                prefixIcon: Icon(
                  Icons.info_outline,
                ),
                labelText: "Number STR",
              ),
            ),
          ),
          SizedBox(
            height: 110,
          ),
          Container(
            width: 214,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Center(
              child: TextWidget(
                label: "Simpan",
                weight: "bold",
                type: "s3",
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

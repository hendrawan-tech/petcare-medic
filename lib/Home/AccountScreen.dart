import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(title: "Account"),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColor3,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
              ),
              child: Container(
                height: 90,
                width: 90,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    90,
                  ),
                ),
                child: ImageWidget(
                  image:
                      "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                  width: 90,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            TextWidget(
              label: "Drh. Annisa",
              weight: "bold",
              type: "s3",
              color: whiteColor,
            ),
            TextWidget(
              label: "annisa@gmail.com",
              type: "b2",
              color: whiteColor,
            ),
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Container(
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.settings,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextWidget(
                      label: "Pengaturan Akun",
                      type: "medium",
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
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
              child: Container(
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.calendar_month,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextWidget(
                      label: "Daftar User",
                      type: "medium",
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
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
              child: Container(
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.bar_chart,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextWidget(
                      label: "Laporan",
                      type: "medium",
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 124,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.exit_to_app,
                  size: 40,
                  color: whiteColor,
                ),
                TextWidget(
                  label: "Log Out",
                  type: "s3",
                  weight: "bold",
                  color: whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

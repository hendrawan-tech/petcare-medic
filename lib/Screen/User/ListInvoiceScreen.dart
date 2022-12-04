import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardTagihan.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class ListInvoiceScreen extends StatelessWidget {
  const ListInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: HeaderWidget(
        title: "Tagihan",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: InputWidget(
                title: "hidden",
                hintText: "Cari tagihan . . .",
                iconLeft: Icons.search,
              ),
            ),
            ListView.builder(
              itemCount: listTagihan.length,
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
                  child: CardTagihan(
                    data: listTagihan[index],
                    onPress: () {
                      print(
                        listJadwalControl[index],
                      );
                    },
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

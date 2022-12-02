import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardUserList.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "User List",
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari user . . .",
                prefixIcon: Icon(
                  Icons.search,
                ),
                suffixIcon: Icon(
                  Icons.list,
                ),
                fillColor: Color(0xffE8F9F2),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            itemCount: listJadwalUser.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: 14,
                ),
                child: CardUserList(
                  input: listJadwalUser[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

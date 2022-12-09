import 'package:flutter/material.dart';
import 'package:medic_petcare/Config/Network.dart';
import 'package:medic_petcare/Provider/UserProvider.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:provider/provider.dart';

class SettingsAccountScreen extends StatefulWidget {
  const SettingsAccountScreen({super.key});

  @override
  State<SettingsAccountScreen> createState() => _SettingsAccountState();
}

class _SettingsAccountState extends State<SettingsAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HeaderWidget(
        title: "Pengaturan Akun",
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          var user = value.getUserData;
          var meta = user['user_metas'][0];
          return Column(
            children: [
              Center(
                heightFactor: 1.5,
                child: Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor,
                      width: 2,
                    ),
                  ),
                  child: ImageWidget(
                    image: "${Network().photoUrl}${user['avatar']}",
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
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
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: InputWidget(
                        title: "Nama",
                        hintText: user['name'],
                        enable: false,
                      ),
                    ),
                    ImageWidget(
                      image: pencilIcon,
                      height: 14,
                      width: 14,
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
                    const Icon(
                      Icons.mail_outline,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: InputWidget(
                        title: "E-mail",
                        hintText: user['email'],
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
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: InputWidget(
                        title: "Nomor Telepon",
                        hintText: user['phone_number'],
                        enable: false,
                      ),
                    ),
                    ImageWidget(
                      image: pencilIcon,
                      height: 14,
                      width: 14,
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
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: InputWidget(
                        title: "Nomor STR",
                        hintText: meta['str_number'],
                        enable: false,
                      ),
                    ),
                    ImageWidget(
                      image: pencilIcon,
                      height: 14,
                      width: 14,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 32,
                ),
                width: 214,
                child: ButtonWidget(
                  title: "Simpan",
                  onPressed: () {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

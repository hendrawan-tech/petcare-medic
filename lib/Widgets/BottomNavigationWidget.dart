import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medic_petcare/Screen/Acccount/AccountLandingScreen.dart';

import 'package:medic_petcare/Screen/Home/HomeScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/MedicalRecordScreen.dart';
import 'package:medic_petcare/Screen/Patient/ListPatientScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/MedicalRecordLandingScreen.dart';

import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ModalOptionWidget.dart';

class BottomNavigationWidget extends StatefulWidget {
  int selectedIndex = 0;

  BottomNavigationWidget({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const MedicalRecordLandingScreen(),
    const MedicalRecordScreen(),
    const ListPatientScreen(),
    const AccountLandingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  onPressBottomTop() async {
    exit(0);
  }

  onPressButtonBottom() async {
    Navigator.pop(context);
  }

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return ModalOptionWidget(
              title: "Konfirmasi",
              subtitle: "Apakah anda yakin ingin keluar dari aplikasi?",
              titleButtonTop: 'Iya',
              titleButtonBottom: 'Tidak',
              onPressButtonTop: onPressBottomTop,
              onPressButtonBottom: onPressButtonBottom,
              imageTopHeight: 125,
              textAlign: TextAlign.left,
              axisText: CrossAxisAlignment.start,
              alignmentText: Alignment.centerLeft,
            );
          },
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: _pages.elementAt(widget.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedFontSize: 12,
          selectedItemColor: fontPrimaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
          currentIndex: widget.selectedIndex, //New
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: getIcon(homeIcon),
              activeIcon: getIcon(homeActiveIcon),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: getIcon(medicIcon),
              activeIcon: getIcon(medicActiveIcon),
              label: "Rekam Medis",
            ),
            BottomNavigationBarItem(
              icon: getIcon(invoiceIcon),
              activeIcon: getIcon(invoiceActiveIcon),
              label: "Traksaksi",
            ),
            BottomNavigationBarItem(
              icon: getIcon(usersIcon),
              activeIcon: getIcon(usersActiveIcon),
              label: "Daftar Pasien",
            ),
            BottomNavigationBarItem(
              icon: getIcon(accountIcon),
              activeIcon: getIcon(accountActiveIcon),
              label: "Akun",
            ),
          ],
        ),
      ),
    );
  }
}

Widget getIcon(icon) {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      minHeight: 24,
    ),
    child: Image.asset(
      icon,
      width: 24,
      fit: BoxFit.cover,
    ),
  );
}

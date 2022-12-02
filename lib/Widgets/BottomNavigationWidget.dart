import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medic_petcare/Acccount/AccountLandingScreen.dart';
import 'package:medic_petcare/Home/AccountScreen.dart';
import 'package:medic_petcare/Home/HomeScreen.dart';
import 'package:medic_petcare/MedicalRecord/MedicalRecordScreen.dart';
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
    const MedicalRecordScreen(),
    const AccountLandingScreen(),
    const AccountLandingScreen(),
    const AccountScreen(),
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
              title: "confirmTitle",
              subtitle: "confirmClose",
              titleButtonTop: 'confirm.yes',
              titleButtonBottom: 'confirm.no',
              onPressButtonTop: onPressBottomTop,
              onPressButtonBottom: onPressButtonBottom,
              imageTopHeight: 125,
              textAlign: TextAlign.center,
              axisText: CrossAxisAlignment.center,
              alignmentText: Alignment.center,
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

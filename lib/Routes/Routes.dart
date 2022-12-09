import 'package:flutter/material.dart';
import 'package:medic_petcare/Screen/Acccount/AccountLandingScreen.dart';
import 'package:medic_petcare/Screen/Auth/LoginScreen.dart';
import 'package:medic_petcare/Screen/Home/PracticeScheduleLandingScreen.dart';

import 'package:medic_petcare/Screen/Home/SettingsAccountScreen.dart';
import 'package:medic_petcare/Screen/Auth/SplashScreen.dart';

import 'package:medic_petcare/Screen/Patient/DetailControlScheduleScreen.dart';
import 'package:medic_petcare/Screen/Patient/ListControlScheduleScreen.dart';
import 'package:medic_petcare/Screen/Patient/ListPatientScreen.dart';
import 'package:medic_petcare/Screen/Report/ListReportScreen.dart';

import 'package:medic_petcare/Screen/User/DetailInvoiceScreen.dart';

import 'package:medic_petcare/Screen/User/DetailUserScreen.dart';

import 'package:medic_petcare/Screen/User/ListInvoiceScreen.dart';
import 'package:medic_petcare/Screen/User/ListUserScreen.dart';

import 'package:medic_petcare/Widgets/BottomNavigationWidget.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String loginScreen = 'loginScreen';
  static const String homeScreen = 'homeScreen';
  static const String listcontrolSceduleScreen = 'ListcontrolSceduleScreen';
  static const String detailControlScheduleScreen =
      'detailControlScheduleScreen';
  static const String practiceScheduleLandingScreen =
      'PracticeScheduleLandingScreen';
  static const String accountLandingScreen = 'AccountLandingScreen';
  static const String settingsAccountScreen = 'SettingsAccountScreen';
  static const String listUserScreen = 'ListUserScreen';
  static const String detailUserScreen = 'DetailUserScreen';
  static const String listInvoiceScreen = 'ListInvoiceScreen';
  static const String detailInvoiceScreen = 'DetailInvoiceScreen';
  static const String listPatientScreen = 'ListPatientScreen';
  static const String listReportScreen = 'ListReportScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case loginScreen:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case homeScreen:
        return PageTransition(
          child: BottomNavigationWidget(
            selectedIndex: int.tryParse(settings.arguments.toString()) ?? 0,
          ),
          type: PageTransitionType.rightToLeft,
        );
      case listcontrolSceduleScreen:
        return PageTransition(
          child: const ListControlSceduleScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case detailControlScheduleScreen:
        return PageTransition(
          child: const DetailControlScheduleScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case practiceScheduleLandingScreen:
        return PageTransition(
          child: const PracticeScheduleLandingScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case accountLandingScreen:
        return PageTransition(
          child: const AccountLandingScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case settingsAccountScreen:
        return PageTransition(
          child: const SettingsAccountScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case listUserScreen:
        return PageTransition(
          child: const ListUserScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case detailUserScreen:
        return PageTransition(
          child: const DetailUserScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case listInvoiceScreen:
        return PageTransition(
          child: const ListInvoiceScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case detailInvoiceScreen:
        return PageTransition(
          child: const DetailInvoiceScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case listPatientScreen:
        return PageTransition(
          child: const ListPatientScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case listReportScreen:
        return PageTransition(
          child: const ListReportScreen(),
          type: PageTransitionType.rightToLeft,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text("kosong"),
        ),
      ),
    );
  }
}

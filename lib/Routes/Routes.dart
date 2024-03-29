import 'package:flutter/material.dart';
import 'package:medic_petcare/Home/AccountScreen.dart';

import 'package:medic_petcare/Home/PracticeScheduleScreen.dart';

import 'package:medic_petcare/Home/SettingsAccountScreen.dart';
import 'package:medic_petcare/Patient/ControlScheduleScreen.dart';
import 'package:medic_petcare/Patient/DetailControlScheduleScreen.dart';
import 'package:medic_petcare/Patient/DetailUserScreen.dart';
import 'package:medic_petcare/Patient/UserListScreen.dart';

import 'package:medic_petcare/Widgets/BottomNavigationWidget.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String homeScreen = 'homeScreen';
  static const String controlSceduleScreen = 'controlSceduleScreen';
  static const String detailControlScheduleScreen =
      'detailControlScheduleScreen';
  static const String practiceScheduleScreen = 'practiceScheduleScreen';
  static const String accountScreen = 'AccountScreen';
  static const String settingsAccountScreen = 'SettingsAccountScreen';
  static const String userListScreen = 'UserListScreen';
  static const String detailUserScreen = 'DetailUserScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return PageTransition(
          child: BottomNavigationWidget(
            selectedIndex: int.tryParse(settings.arguments.toString()) ?? 0,
          ),
          type: PageTransitionType.rightToLeft,
        );
      case controlSceduleScreen:
        return PageTransition(
          child: const ControlSceduleScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case detailControlScheduleScreen:
        return PageTransition(
          child: const DetailControlScheduleScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case practiceScheduleScreen:
        return PageTransition(
          child: const PracticeScheduleScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case accountScreen:
        return PageTransition(
          child: const AccountScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case settingsAccountScreen:
        return PageTransition(
          child: const SettingsAccountScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case userListScreen:
        return PageTransition(
          child: const UserListScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case detailUserScreen:
        return PageTransition(
          child: const DetailUserScreen(),
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

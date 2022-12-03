import 'package:flutter/material.dart';
import 'package:medic_petcare/Screen/Acccount/AccountLandingScreen.dart';
import 'package:medic_petcare/Screen/Auth/LoginScreen.dart';

import 'package:medic_petcare/Screen/Home/PracticeScheduleScreen.dart';
import 'package:medic_petcare/Screen/Home/SettingsAccountScreen.dart';
import 'package:medic_petcare/Screen/Auth/SplashScreen.dart';
import 'package:medic_petcare/Screen/Patient/ControlScheduleScreen.dart';
import 'package:medic_petcare/Screen/Patient/DetailControlScheduleScreen.dart';
import 'package:medic_petcare/Screen/User/DetailUserScreen.dart';
import 'package:medic_petcare/Screen/User/UserListScreen.dart';

import 'package:medic_petcare/Widgets/BottomNavigationWidget.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String loginScreen = 'loginScreen';
  static const String homeScreen = 'homeScreen';
  static const String controlSceduleScreen = 'controlSceduleScreen';
  static const String detailControlScheduleScreen =
      'detailControlScheduleScreen';
  static const String practiceScheduleScreen = 'practiceScheduleScreen';
  static const String accountLandingScreen = 'AccountLandingScreen';
  static const String settingsAccountScreen = 'SettingsAccountScreen';
  static const String userListScreen = 'UserListScreen';
  static const String detailUserScreen = 'DetailUserScreen';

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

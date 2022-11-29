import 'package:flutter/material.dart';

import 'package:medic_petcare/Home/PracticeScheduleScreen.dart';
import 'package:medic_petcare/Patient/ControlScheduleScreen.dart';
import 'package:medic_petcare/Patient/DetailControlScheduleScreen.dart';

import 'package:medic_petcare/Widgets/BottomNavigationWidget.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String homeScreen = 'homeScreen';
  static const String controlSceduleScreen = 'controlSceduleScreen';
  static const String detailControlScheduleScreen =
      'detailControlScheduleScreen';
  static const String practiceScheduleScreen = 'practiceScheduleScreen';

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

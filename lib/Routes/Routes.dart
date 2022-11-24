import 'package:flutter/material.dart';
import 'package:medic_petcare/Widgets/BottomNavigationWidget.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String homeScreen = 'homeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return PageTransition(
          child: BottomNavigationWidget(
            selectedIndex: int.tryParse(settings.arguments.toString()) ?? 0,
          ),
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

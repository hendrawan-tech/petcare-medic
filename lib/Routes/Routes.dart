import 'package:flutter/material.dart';
import 'package:medic_petcare/Screen/Acccount/AccountLandingScreen.dart';
import 'package:medic_petcare/Screen/Article/ArticleListScreen.dart';
import 'package:medic_petcare/Screen/Auth/LoginScreen.dart';
import 'package:medic_petcare/Screen/Home/InvoiceDetailScreen.dart';
import 'package:medic_petcare/Screen/Home/PracticeScheduleLandingScreen.dart';
import 'package:medic_petcare/Screen/Home/SettingsAccountScreen.dart';
import 'package:medic_petcare/Screen/Auth/SplashScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/Care/FormAddCareScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/ControleSchedule/StepAddControlSchedule.dart';
import 'package:medic_petcare/Screen/MedicalRecord/ControleSchedule/StepControlScheduleScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/MedicalRecordFormScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/MedicalRecordScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/Prescription/StepAddPrescriptionScreen.dart';
import 'package:medic_petcare/Screen/MedicalRecord/Prescription/StepListDrugScreen.dart';
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
  static const String articleListScreen = 'ArticleListScreen';
  static const String medicalRecordFormScreen = 'medicalRecordFormScreen';
  static const String medicalRecordScreen = 'medicalRecordScreen';
  static const String formAddCareScreen = 'formAddCareScreen';
  static const String addPrescriptionScreen = 'AddPrescriptionScreen';
  static const String stepListDrugScreen = 'stepListDrugScreen';
  static const String stepAddControlSchedule = 'stepAddControlSchedule';

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
          child: const InvoiceDetailScreen(),
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
      case articleListScreen:
        return PageTransition(
          child: const ArticleListScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case medicalRecordFormScreen:
        return PageTransition(
          child: const MedicalRecordFormScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case medicalRecordScreen:
        return PageTransition(
          child: const MedicalRecordScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case formAddCareScreen:
        return PageTransition(
          child: const FormAddCareScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case addPrescriptionScreen:
        return PageTransition(
          child: const StepAddPrescriptionScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case stepListDrugScreen:
        return PageTransition(
          child: const StepListDrugScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case stepAddControlSchedule:
        return PageTransition(
          child: const StepAddControlSchedule(),
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

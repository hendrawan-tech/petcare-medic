import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/ArticleProvider.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Provider/PatientProvider.dart';
import 'package:medic_petcare/Provider/PracticeScheduleProvider.dart';
import 'package:medic_petcare/Provider/RegistrationProvider.dart';
import 'package:medic_petcare/Provider/UserProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (BuildContext context) => UserProvider(),
        ),
        ChangeNotifierProvider<ArticleProvider>(
          create: (BuildContext context) => ArticleProvider(),
        ),
        ChangeNotifierProvider<PracticeScheduleProvider>(
          create: (BuildContext context) => PracticeScheduleProvider(),
        ),
        ChangeNotifierProvider<PatientProvider>(
          create: (BuildContext context) => PatientProvider(),
        ),
        ChangeNotifierProvider<RegistrationProvider>(
          create: (BuildContext context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider<MedicalRecordProvider>(
          create: (BuildContext context) => MedicalRecordProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Doctor Petcare App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        initialRoute: Routes.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

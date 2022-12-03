import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/UserProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (BuildContext context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Doctor Petcare App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

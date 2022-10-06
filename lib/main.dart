import 'package:flutter/material.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
import 'package:time_to_run/screens/bmi_screen.dart';
//import 'package:time_to_run/screens/intro_screen.dart';
import 'package:time_to_run/screens/login_screen.dart';

import 'mongodb/mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await MongoDatabase.connect();
  runApp(TimeToRunApp());
}

class TimeToRunApp extends StatelessWidget {
  const TimeToRunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => LoginScreen(),
        '/bmi': (context) => BmiScreen(),
        '/addRun': (context) => AddRunScreen(),
      },
      initialRoute: '/',
    );
    // home: IntroScreen());
  }
}

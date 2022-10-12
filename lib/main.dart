import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_to_run/provider/theme_provider.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
import 'package:time_to_run/screens/intro_screen.dart';
import 'package:time_to_run/widget/item_listing.dart';
import 'package:time_to_run/screens/master_detail_container.dart';
import 'package:time_to_run/screens/login_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TimeToRunApp());
}

class TimeToRunApp extends StatelessWidget {
  const TimeToRunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(primarySwatch: Colors.blueGrey),
            //darkTheme: ThemeData.dark(),
            darkTheme: MyThemes.darkTheme,
            routes: {
              '/': (context) => LoginScreen(),
              '/overview': (context) => MasterDetailContainer(),
              '/intro': (context) => IntroScreen(),
              '/addRun': (context) => AddRunScreen(),
            },
            initialRoute: '/intro',

            // home: MasterDetailContainer(),
          );
        });
  }
}

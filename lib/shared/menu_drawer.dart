import 'package:flutter/material.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
//import 'package:time_to_run/screens/weather_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';
import 'package:time_to_run/screens/user.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
      'Add run'
    ];

    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Time To Run',
            style: TextStyle(color: Colors.white, fontSize: 28))));

    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = IntroScreen(user: user);
                break;
              case 'BMI Calculator':
                screen = BmiScreen(user: user);
                break;
              // case 'Weather':
              //   screen = WeatherScreen();
              //   break;
              case 'Add run':
                screen = AddRunScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });

    return menuItems;
  }
}

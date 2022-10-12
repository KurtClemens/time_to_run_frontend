import 'package:flutter/material.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
import 'package:time_to_run/screens/login_screen.dart';
import 'package:time_to_run/screens/master_detail_container.dart';
import 'package:time_to_run/screens/setting_screen.dart';
import 'package:time_to_run/screens/weather_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

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
      'Overview',
      'Add run',
      'Settings',
      'Log out'
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
                screen = IntroScreen();
                break;
              case 'Overview':
                screen = MasterDetailContainer();
                break;
              case 'Add run':
                screen = AddRunScreen();
                break;
              case 'Settings':
                screen = SettingScreen();
                break;
              case 'Log out':
                screen = LoginScreen();
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

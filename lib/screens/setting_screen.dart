import 'package:flutter/material.dart';
import 'package:time_to_run/widget/change_theme_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Dark mode'),
      actions: [
        ChangeThemeButtonWidget(),
      ],
    ));
  }
}
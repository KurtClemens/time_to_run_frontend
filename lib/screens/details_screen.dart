import 'package:flutter/material.dart';
import 'package:time_to_run/main.dart';
import 'package:time_to_run/mongodb/mongoDbModel.dart';

class DetailsScreen extends StatelessWidget {
  final mongoDbModel run;

  const DetailsScreen({
    Key? key,
    required this.run,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(run.name),
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              (Text(run.distance)),
              (Text(run.location)),
              (Text(run.date))
            ])));
  }
}
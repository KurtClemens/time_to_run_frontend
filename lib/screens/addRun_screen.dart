import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongodart;
import 'package:time_to_run/screens/master_detail_container.dart';
import 'package:time_to_run/shared/run.dart';
import 'package:time_to_run/services/service.dart';
import 'package:time_to_run/shared/strings.dart';
// import 'package:time_to_run/services/dbservices.dart';

class AddRunScreen extends StatefulWidget {
  const AddRunScreen({super.key});

  @override
  State<AddRunScreen> createState() => _AddRunState();
}

class _AddRunState extends State<AddRunScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDistance = TextEditingController();
  final TextEditingController txtLocation = TextEditingController();
  final TextEditingController txtDate = TextEditingController();
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  Run run = Run(name: '', distance: '', location: '', date: '', img: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.addRun), actions: [
          ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String name = run.name;
                  String distance = run.distance;
                  String location = run.location;
                  String date = run.date;
                  String img = "";
                  Service().addRun(name, distance, location, date, img);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MasterDetailContainer()));
                }
              },
              icon: Icon(
                Icons.add,
                size: 24,
              ),
              label: Text(Strings.add)),
        ]),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/Man-running-beach.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Stack(children: [
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 150, 16, 16),
                      child: TextFormField(
                        controller: TextEditingController(text: run.name),
                        onChanged: (value) {
                          run.name = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Strings.enterNameOfRun;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: Strings.enterRun,
                          filled: true,
                          fillColor: Colors.white38,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: run.distance),
                        onChanged: (value) {
                          run.distance = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Strings.enterDistanceRun;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: Strings.enterDistance,
                          filled: true,
                          fillColor: Colors.white38,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: run.location),
                        onChanged: (value) {
                          run.location = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Strings.enterLocationRun;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: Strings.enterLocation,
                          filled: true,
                          fillColor: Colors.white38,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: run.date),
                        onChanged: (value) {
                          run.date = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Strings.enterDateRun;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: Strings.enterDateInFormat,
                          filled: true,
                          fillColor: Colors.white38,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ]))));
  }
}

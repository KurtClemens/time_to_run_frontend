import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongodart;
import 'package:time_to_run/mongodb/mongodb.dart';
import 'package:time_to_run/screens/overview_screen.dart';
import 'package:time_to_run/screens/run.dart';
import 'package:time_to_run/services/authservice.dart';
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

  Run run = Run("", "", "", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add a run!'), actions: [
          //       Padding(
          // padding: EdgeInsets.fromLTRB(275, 145, 16, 0),
          // child: Container(
          //   height: 45,
          ElevatedButton.icon(
              // style: ButtonStyle(
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(18))),
              // ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String name = run.name;
                  String distance = run.distance;
                  String location = run.location;
                  String date = run.date;
                  AuthService().addRun(name, distance, location, date);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => OverviewScreen()));
                }
              },
              icon: Icon(
                Icons.add,
                size: 24,
              ),
              label: Text('Add')),
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
                            return 'Enter the name of the run';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter the name',
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
                            return 'Enter the distance of the run';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter the distance',
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
                            return 'Enter the location of the run';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter the location',
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
                            return 'Enter the date of the run';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter the date in format 2000-12-31',
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

//   Future createRun({required String name}) async {
//     final run = Run(id: mongodart.ObjectId(), name: name);
//     final json = {
//       'name': name,
//       'distance': 10,
//       'location': 'Tongeren',
//       'date': new DateTime(2022, 10, 9) 
//     };
//     MongoDatabase.addRun(json);
//   }
// }

// class Run {
//   final mongodart.ObjectId? id;
//   final String? name;

//   const Run({this.id, this.name});
// }

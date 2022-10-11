import 'package:meta/meta.dart';
import 'package:time_to_run/services/service.dart';

class Run {
  Run(
      {required this.name,
      required this.distance,
      required this.location,
      required this.date});

  String name;
  String distance;
  String location;
  String date;

  //Run(this.name, this.distance, this.location, this.date);

  //static fromJson(model) {}

  factory Run.fromJson(Map<String, dynamic> json) => Run(
        name: json['name'],
        distance: json['distance'],
        location: json['location'],
        date: json['date'],
      );
}

// fromJson(Map<String, dynamic> json) {
//   name:
//   json['name'];
//   distance:
//   json['distance'];
//   location:
//   json['location'];
//   date:
//   json['date'];
// }
// var runList = null;

// List<Run> runs = List<Run>.from(runList.map((model) => Run.fromJson(model)));

final List<Run> items2 = <Run>[
  Run(
      name: 'Item kurt',
      distance: 'kurt 1',
      location: 'helen 1',
      date: 'otis 1'),
  Run(name: 'Item helen', distance: '2', location: '2', date: '2'),
  Run(name: 'Item otis', distance: '3', location: '3', date: '3')
];

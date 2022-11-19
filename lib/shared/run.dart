import 'package:meta/meta.dart';
import 'package:time_to_run/services/service.dart';

class Run {
  Run(
      {required this.name,
      required this.distance,
      required this.location,
      required this.date,
      required this.img});

  String name;
  String distance;
  String location;
  String date;
  String img;

  factory Run.fromJson(Map<String, dynamic> json) => Run(
        name: json['name'],
        distance: json['distance'],
        location: json['location'],
        date: json['date'],
        img: json['img'],
      );
}

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

mongoDbModel mongoDbModelFromJson(String str) =>
    mongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(mongoDbModel data) => json.encode(data.toJson());

class mongoDbModel {
  mongoDbModel(
      {required this.id,
      required this.name,
      required this.distance,
      required this.location,
      required this.date});

  String id;
  String name;
  String distance;
  String location;
  String date;

  factory mongoDbModel.fromJson(Map<String, dynamic> json) => mongoDbModel(
        id: json['_id'],
        name: json['name'],
        distance: json['distance'],
        location: json['location'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "distance": distance,
        "location": location,
        "date": date
      };
}

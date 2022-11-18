import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:time_to_run/shared/run.dart';
import 'package:time_to_run/shared/constant.dart';

class Service {
  Dio dio = new Dio();

  login(email, password) async {
    try {
      return await dio.post('https://time-to-run.onrender.com/authenticate',
          data: {
            'email': email,
            'password': password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  // addImage(name, img) async{
  //   try {
  //     return await dio.patch('https://time-to-run.onrender.com/addimage',
  //         data: {
  //           'name': name,
  //           'img': img,
  //         },
  //         options: Options(contentType: Headers.formUrlEncodedContentType));
  //   } on DioError catch (e) {
  //     Fluttertoast.showToast(
  //         msg: e.response!.data['msg'],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16);
  //   }
  // }

  addRun(name, distance, location, date, img) async {
    try {
      return await dio.post('https://time-to-run.onrender.com/addrun',
          data: {
            'name': name,
            'distance': distance,
            'location': location,
            'date': date,
            'img': img,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  addUser(email, password) async {
    try {
      return await dio.post('https://time-to-run.onrender.com/adduser',
          data: {
            'email': email,
            'password': password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://time-to-run.onrender.com/getinfo');
  }
}

getAllRuns2() async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  final runCollection = await db.collection(COLLECTION_NAME_RUNS);
  //print(await runCollection.find().toList());
  return runCollection.find();
}

getAllRuns() async {
  try {
    var url = Uri.parse('https://time-to-run.onrender.com/getruns');
    var response = await http.get(url);
    var runs = [];

    var runsJson = jsonDecode(response.body);
    for (var runJson in runsJson) {
      runs.addAll((runsJson as List).map((e) => Run.fromJson(e)).toList());
    }
    return runsJson;
  } catch (e) {
    print(e);
    rethrow;
  }
}

getAllRuns3() async {
  var url = Uri.parse('https://time-to-run.onrender.com/getruns');
  var response = await http.get(url);
  var jsonList = jsonDecode(response.body);
  return jsonList;
}

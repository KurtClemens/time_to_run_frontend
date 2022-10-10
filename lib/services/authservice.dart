import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:time_to_run/mongodb/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_to_run/data/http_helper.dart';
import 'package:http/http.dart' as http;
import 'package:time_to_run/shared/run.dart';

class AuthService {
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

  addRun(name, distance, location, date) async {
    try {
      return await dio.post('https://time-to-run.onrender.com/addrun',
          data: {
            'name': name,
            'distance': distance,
            'location': location,
            'date': date
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

  //  static Future<List<Map<String, dynamic>>> getAllRuns() async {
  //   var db = await Db.create(MONGO_URL);
  //   await db.open();
  //   final runCollection = await db.collection(COLLECTION_NAME_RUNS);
  //   print(await runCollection.find().toList());
  //   return runCollection.find().toList();
  // }

  static getAllRuns() async {
    List<Run> runList = [];
    var url = Uri.parse('https://time-to-run.onrender.com/getruns');
    var response = await http.get(url);
    var jsonList = jsonDecode(response.body);
    return jsonList;
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

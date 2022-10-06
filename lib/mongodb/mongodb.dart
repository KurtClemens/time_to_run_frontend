// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:time_to_run/mongodb/constant.dart';

// var runCollection;

// class MongoDatabase {
//   static connect() async {
//     var db = await Db.create(MONGO_URL);
//     await db.open();
//     runCollection = db.collection(COLLECTION_NAME_RUNS);
//     // inspect(db);
//     // var status = db.serverStatus();
//     // print(status);
//     var userCollection = db.collection(COLLECTION_NAME_USERS);
//     // // await userCollection.insertOne({
//     // //   "username": "maxpayne",
//     // //   "name": "Max Payne",
//     // //   "email": "maxpayne@gmail.com"
//     // // });

//     // await userCollection.insertMany([
//     //   {
//     //     "username": "maxpayne3",
//     //     "name": "Max Payne",
//     //     "email": "maxpayne@gmail.com"
//     //   },
//     //   {
//     //     "username": "maxpayne2",
//     //     "name": "Max Payne",
//     //     "email": "maxpayne@gmail.com"
//     //   },
//     // ]);

//     // print(await userCollection.find().toList());

//     // await userCollection.update(
//     //     where.eq('username', 'maxpayne1'), modify.set('name', 'Max P.'));

//     // print(await userCollection.find().toList());

//     // await userCollection.deleteOne({'name': 'Max P.'});
//   }
// }

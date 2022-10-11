import 'package:flutter/material.dart';
import 'package:time_to_run/mongodb/mongoDbModel.dart';
import 'package:time_to_run/mongodb/mongodb.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
import 'package:time_to_run/screens/details_screen.dart';
import 'package:time_to_run/services/service.dart';
// import 'package:time_to_run/services/dbservices.dart';
import 'package:time_to_run/shared/menu_bottom.dart';
import 'package:time_to_run/shared/menu_drawer.dart';
import 'package:time_to_run/shared/run.dart';
import 'package:time_to_run/shared/strings.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  //List<Run> runs = AuthService().getAllRuns();
  //var runs = MongoDatabase.getRuns();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.overview),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            //future: MongoDatabase.getRuns(),
            future: getAllRuns(),
            builder: (context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                //print(runs);
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  print(snapshot.data.length);

                  // List<Run> runs =
                  //     snapshot.data.map((e) => fromJson(e)).toList();
                  // print(runs.length);
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        // Run run = Run.fromJson(snapshot.data[index]);
                        return ListTile(
                          title: new Text(snapshot.data[index].name),
                        );
                      });
                } else {
                  return Center(
                    child: Text(Strings.noData),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  // Widget displayCard(mongoDbModel data) {
  //   return Card(
  //       shadowColor: Colors.blue,
  //       elevation: 8,
  //       color: Colors.blueGrey,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //       child: ListTile(
  //         title: Text(data.name),
  //         subtitle: Text(data.distance),
  //         trailing: const Icon(Icons.arrow_forward),
  //         onTap: () {
  //           Navigator.of(this.context).push(MaterialPageRoute(
  //               builder: (context) => DetailsScreen(run: data)));
  //         },
  //       ));
  // }
}

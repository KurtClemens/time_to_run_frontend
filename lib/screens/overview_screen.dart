import 'package:flutter/material.dart';
import 'package:time_to_run/mongodb/mongoDbModel.dart';
import 'package:time_to_run/mongodb/mongodb.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
import 'package:time_to_run/screens/details_screen.dart';
import 'package:time_to_run/services/authservice.dart';
// import 'package:time_to_run/services/dbservices.dart';
import 'package:time_to_run/shared/menu_bottom.dart';
import 'package:time_to_run/shared/menu_drawer.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  //List runs = AuthService().getAllRuns();
  //var runs = MongoDatabase.getRuns();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            //future: MongoDatabase.getRuns(),
            future: AuthService.getAllRuns(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCard(
                            mongoDbModel.fromJson(snapshot.data[index]));
                      });
                } else {
                  return Center(
                    child: Text("no data available"),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget displayCard(mongoDbModel data) {
    return Card(
        shadowColor: Colors.blue,
        elevation: 8,
        color: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          title: Text(data.name),
          subtitle: Text(data.distance),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(this.context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(run: data)));
          },
        ));
  }
}
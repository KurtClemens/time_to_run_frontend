import 'package:flutter/material.dart';
import 'package:time_to_run/mongodb/mongoDbModel.dart';
import 'package:time_to_run/mongodb/mongodb.dart';
import 'package:time_to_run/screens/addRun_screen.dart';
import 'package:time_to_run/screens/details_screen.dart';
import 'package:time_to_run/services/service.dart';
// import 'package:time_to_run/services/dbservices.dart';
import 'package:time_to_run/shared/menu_bottom.dart';
import 'package:time_to_run/shared/menu_drawer.dart';
import 'package:time_to_run/shared/strings.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  //List runs = AuthService().getAllRuns();
  //var runs = MongoDatabase.getRuns();
  mongoDbModel data =
      new mongoDbModel(id: "", name: "", distance: "", location: "", date: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.overview),
        ),
        drawer: MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: Container(
            padding: EdgeInsets.all(8),
            child: OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? buildPortrait()
                      : buildLandscape(),
            )));
  }

  Widget buildPortrait() => SafeArea(
          child: SizedBox(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              //future: MongoDatabase.getRuns(),
              //future: AuthService.getAllRuns(),
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
                      child: Text(Strings.noData),
                    );
                  }
                }
              },
            )),
      ));

  Widget buildLandscape() => Row(
        children: [
          SafeArea(
            child: SizedBox(
                width: 250,
                //child: Padding(
                //padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  //future: MongoDatabase.getRuns(),
                 // future: AuthService.getAllRuns(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return displayCard(data =
                                  mongoDbModel.fromJson(snapshot.data[index]));
                              mongoDbModel.fromJson(snapshot.data[index]);
                            });
                      } else {
                        return Center(
                          child: Text(Strings.noData),
                        );
                      }
                    }
                  },
                )),
          ),
          Expanded(
              child: SizedBox(
                  width: 250,
                  child:
                      SingleChildScrollView(child: DetailsScreen(run: data))))
        ],
      );

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

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:time_to_run/shared/run.dart';
import 'package:time_to_run/services/service.dart';
import 'package:time_to_run/shared/strings.dart';

class ItemListing extends StatefulWidget {
  ItemListing({
    required this.itemSelectedCallback,
    required this.selectedItem,
  });

  final ValueChanged<Run> itemSelectedCallback;
  final Run selectedItem;

  @override
  State<ItemListing> createState() => _ItemListingState();
}

class _ItemListingState extends State<ItemListing> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                    onTap: () =>
                        widget.itemSelectedCallback(snapshot.data[index]),
                    selected: widget.selectedItem == snapshot.data[index],
                  );
                });
          } else {
            return Center(
              child: Text(Strings.noData),
            );
          }
        }
      },
    );
  }
}

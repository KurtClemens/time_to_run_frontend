import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:time_to_run/shared/menu_bottom.dart';
import 'package:time_to_run/shared/menu_drawer.dart';
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
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              //future: MongoDatabase.getRuns(),
              future: getAllRuns3(),
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
                              Run.fromJson(snapshot.data[index]));
                        });
                  } else {
                    return Center(
                      child: Text(Strings.noData),
                    );
                  }
                }
              },
            )));
  }

  Widget displayCard(Run run) {
    return ListTile(
      title: Text(run.name),
      subtitle: Text(run.distance),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => widget.itemSelectedCallback(run),
      selected: widget.selectedItem == run,
    );
  }
}

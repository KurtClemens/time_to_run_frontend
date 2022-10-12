import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:time_to_run/shared/run.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({
    required this.isInTabletLayout,
    required this.item,
  });

  final bool isInTabletLayout;
  final Run item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Container(
      child: Center(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                item?.name ?? item.name,
                style: textTheme.headline1,
              ),
              new Text(
                item?.distance ?? item.distance,
                style: textTheme.subtitle1,
              ),
              new Text(
                item?.location ?? item.location,
                style: textTheme.subtitle2,
              ),
              new Text(
                item?.date ?? item.date,
                style: textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );

    if (isInTabletLayout) {
      return new Center(child: content);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(item.name),
      ),
      body: new Center(child: content),
    );
  }
}

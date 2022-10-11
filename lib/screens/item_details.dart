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
    final Widget content = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Text(
          item?.distance ?? 'test',
          style: textTheme.headline1,
        ),
        new Text(
          item?.distance ?? "test2",
          style: textTheme.subtitle1,
        ),
      ],
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

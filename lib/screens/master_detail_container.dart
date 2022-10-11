import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_to_run/screens/item_details.dart';
import 'package:time_to_run/screens/item_listing.dart';
import 'package:time_to_run/shared/run.dart';

class MasterDetailContainer extends StatefulWidget {
  @override
  _ItemMasterDetailContainerState createState() =>
      new _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer> {
  static const int kTabletBreakpoint = 600;

  late Run _selectedItem =
      new Run(date: '', location: '', distance: '', name: '');

  Widget _buildMobileLayout() {
    return new ItemListing(
        itemSelectedCallback: (item) {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) {
                return new ItemDetails(
                  isInTabletLayout: false,
                  item: item,
                );
              },
            ),
          );
        },
        selectedItem: _selectedItem);
  }

  Widget _buildTabletLayout() {
    return new Row(
      children: <Widget>[
        new Flexible(
          flex: 1,
          child: new Material(
            elevation: 4.0,
            child: new ItemListing(
              itemSelectedCallback: (item) {
                setState(() {
                  _selectedItem = item;
                });
              },
              selectedItem: _selectedItem,
            ),
          ),
        ),
        new Flexible(
          flex: 3,
          child: new ItemDetails(
            isInTabletLayout: true,
            item: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Master-detail'),
      ),
      body: new LayoutBuilder(
        builder: (context, constraints) {
          final double smallestDimension = min(
            constraints.maxWidth,
            constraints.maxHeight,
          );

          if (smallestDimension < kTabletBreakpoint) {
            return _buildMobileLayout();
          }

          return _buildTabletLayout();
        },
      ),
    );
  }
}

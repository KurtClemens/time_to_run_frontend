import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongodart;

class AddRunScreen extends StatefulWidget {
  const AddRunScreen({super.key});

  @override
  State<AddRunScreen> createState() => _AddRunState();
}

class _AddRunState extends State<AddRunScreen> {
  final TextEditingController txtName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: txtName),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              String name = txtName.text;
              createRun(name: name);
            },
          )
        ],
      ),
    );
  }

  Future createRun({required String name}) async {
    final run = Run(id: mongodart.ObjectId(), name: name);
    final json = {
      'name': name,
      'distance': 10,
      'location': 'Tongeren',
    };
  }
}

class Run {
  final mongodart.ObjectId? id;
  final String? name;

  const Run({this.id, this.name});
}

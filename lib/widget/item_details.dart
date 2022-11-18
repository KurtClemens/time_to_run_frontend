import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_to_run/shared/run.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({
    required this.isInTabletLayout,
    required this.item,
  });

  final bool isInTabletLayout;
  final Run item;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  File? image;

  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      
      final imageTemp = File(image.path);

      setState(()=>this.image = imageTemp);
   }
    on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }

    Future pickImageCamera() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      
      final imageTemp = File(image.path);

      setState(()=>this.image = imageTemp);
   }
    on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }

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
                widget.item?.name ?? widget.item.name,
                style: textTheme.headline3,
              ),
              new Text(
                widget.item?.distance ?? widget.item.distance,
                style: textTheme.subtitle1,
              ),
              new Text(
                widget.item?.location ?? widget.item.location,
                style: textTheme.subtitle2,
              ),
              new Text(
                widget.item?.date ?? widget.item.date,
                style: textTheme.subtitle2,
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text("Pick image from Gallery",
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)
                ),
                onPressed: (){
                  pickImage();
                }
                ),
              MaterialButton(
                color: Colors.blue,
                child: Text("Pick image from Camera",
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)
                ),
                onPressed: (){
                  pickImageCamera();
                }
                ),
                SizedBox(height: 20,),
                image !=null ? Image.file(image!) : Text("No image selected")
            ],
          ),
        ),
      ),
    );

    if (widget.isInTabletLayout) {
      return new Center(child: content);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.item.name),
      ),
      body: new Center(child: content),
    );
  }
}

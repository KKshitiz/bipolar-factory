import 'dart:io';
import 'package:bipolar/services/local_image_picker.dart';
import 'package:flutter/material.dart';

class LocalImageDisplay extends StatefulWidget {
  @override
  _LocalImageDisplayState createState() => _LocalImageDisplayState();
}

class _LocalImageDisplayState extends State<LocalImageDisplay> {
  LocalImagePicker localImagePicker = new LocalImagePicker();
  File image;
  Future getImageCamera() async {
    await localImagePicker.getImageFromCamera();
    setState(() {
      image = localImagePicker.getImage();
    });
  }

  Future getImageGallery() async {
    await localImagePicker.getImageFromGallery();
    setState(() {
      image = localImagePicker.getImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Selected Image',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Container(
            child: Center(
              child: image == null ? PlaceholderImage() : Image.file(image),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: getImageCamera,
                child: Icon(Icons.camera_alt),
              ),
              RaisedButton(
                onPressed: getImageGallery,
                child: Icon(Icons.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          'No image selected.',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('camera'),
      ),
    );
  }

  List<Map<String, dynamic>> _iconData;
  Future _cameraOn() async =>
      await ImagePicker.pickImage(source: ImageSource.camera);
  Future _galleryOn() async =>
      await ImagePicker.pickImage(source: ImageSource.gallery);
  @override
  void initState() {
    _iconData = [
      {
        'Icon': Icon(Icons.camera_alt),
        'onClick': _cameraOn(),
      },
      {
        'Icon': Icon(Icons.camera),
        'onClick': _galleryOn(),
      },
    ];
    super.initState();
  }
}

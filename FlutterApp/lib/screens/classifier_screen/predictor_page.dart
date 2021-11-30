import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:image_picker/image_picker.dart';
import 'package:traffic_sign_identity/screens/classifier_screen/result_screen.dart';

import '../traffic_app.dart';

class PredictorPage extends StatefulWidget {
  @override
  _PredictorPageState createState() => _PredictorPageState();
}

class _PredictorPageState extends State<PredictorPage> {
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      _selectedButton = 0;

      if (_image != null) {
        _selectedButton = 2;
      }
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _selectedButton = 1;
      if (_image != null) {
        _selectedButton = 2;
      }
    });
  }

  Future<Post> fetchResults() async {
    final response = await get('http://jsonplaceholder.typicode.com/posts/1');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      print(json.decode(response.body));
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      print("ERROR");
      throw Exception('Failed to load post');
    }
  }

  _predict(BuildContext context) {
    // Test Code
    _doNothing();
    // End test code
    Navigator.pushNamed(context, ClassifierResultRoute,
        arguments: {'image': _image, 'posts': fetchResults()});
    _selectedButton = 0;
    if (_image != null) {
      _selectedButton = 2;
    }
  }

  File _image;
  int _selectedButton = 0;

  _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedButton,
      onTap: (int index) => _handleNavigation(index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_enhance,
            size: 40.0,
          ),
          title: Text('Camera'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.photo_library,
            size: 40.0,
          ),
          title: Text('Gallery'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.play_circle_filled,
            size: 40.0,
          ),
          title: Text('Guess'),
        ),
      ],
    );
  }

  _doNothing() {
    print('I predict!!');
    _printImage(_image);
  }

  _printImage(File img) {
    //prefix0.Image image = prefix0.decodeImage(img..read);
    // print(image[0]);
  }

  _handleNavigation(int index) {
    switch (index) {
      case 0:
        getImage();
        break;
      case 1:
        getImageFromGallery();
        break;
      case 2:
        _predict(context);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLASSIFY'),
      ),

      body: Column(
        children: [
          GestureDetector(
            onTap: _image == null ? getImageFromGallery : null,
            child: _image == null
                ? Center(
                    heightFactor: 15.0,
                    child: Text(
                      'Add Image to Begin',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  )
                : Container(
                    height: 530.0,
                    padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 5.0),
                    child: SingleChildScrollView(
                      child: Image.file(
                        _image, fit: BoxFit.cover,
                        //height: 500.0,
                        //width: 500.0,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      // _predictButton(),

      bottomNavigationBar: _bottomNavBar(),
    );
  }
}

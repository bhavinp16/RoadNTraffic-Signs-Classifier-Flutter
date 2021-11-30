import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:traffic_sign_identity/models/ClassifierResult.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// Make it stateless and work out the logic to only call the backend once
class ResultScreen extends StatelessWidget {
  final File image;

  final Future<Post> post;
  ResultScreen(this.image, this.post);

  // Future<Predicition> fetchResults() async {
  //   Predicition prediction;
  //   final url = 'http://demo-keroku-app-api.herokuapp.com/upload';
  //   var request = new MultipartRequest("POST", Uri.parse(url));
  //   print(Uri.parse(url).toString());
  //   request.files
  //       .add(new MultipartFile.fromBytes('file', image.readAsBytesSync()));
  //   request.send().then((result) async {
  //     Response.fromStream(result).then((response) {
  //       if (response.statusCode == 200) {
  //         // response is OK
  //         print('SuccessFul Execution'+ response.statusCode.toString());
  //         print('ResponesBody' + response.body);
  //         prediction = Predicition.fromJson(json.decode(response.body));
  //       } else {
  //         // Error occurs
  //         throw Exception('Failed to fetch results!');
  //       }
  //     });
  //   }).catchError((err) => print('error:' + err.toString()));
  //   return prediction;
  // }

  Future<Predicition> fetchResults() async {
    //Predicition prediction;
    final url = 'http://10.0.2.2:5000/upload';
    var request = new MultipartRequest("POST", Uri.parse(url));
    print(Uri.parse(url).toString());
    request.files.add(new MultipartFile.fromBytes(
        'file', image.readAsBytesSync(),
        filename: 'image.jpeg', contentType: new MediaType('image', 'jpeg')));
    print('File List :: ' + request.files[0].toString());
    print('Image as Bytes : ' + image.readAsBytesSync().toString());
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    print('Response efinale::  ' + respStr);
    return Predicition.fromJson(json.decode(respStr));
  }

  @override
  Widget build(BuildContext context) {
    //final Future<ClassifierResult> results = fetchResults();   // dependent on call
    final Future<Predicition> results = fetchResults();
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Center(
        child: FutureBuilder(
          future: results,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _renderResult(snapshot, this.image, context);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return LinearProgressIndicator();
          },
        ),
      ),
    );
  }
}

Widget _renderResult(AsyncSnapshot snapshot, File image, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(5.0, 20, 2.0, 2.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Image.file(
            image,
            fit: BoxFit.fitHeight,
          ),
          width: MediaQuery.of(context).size.width * 0.65,
          margin: EdgeInsets.symmetric(vertical: 10),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0,vertical: 15.0),
          child: Text(
            'Class: ' + snapshot.data.predicitionClass.toString(), // Dependent
            style: TextStyle(fontSize: 28.0),
          ),
        ),Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0,vertical: 5.0),
          child: Text(
            'Confidence: ' + snapshot.data.confidence.toString(), // Dependent
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        Center(
          //padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Text(
              snapshot.data.classDesc, // Dependent
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        )
      ],
    ),
  );
}

// Future<Post> fetchResults() async{
//   final response =
//     await get('http://jsonplaceholder.typicode.com/posts/1');
// if (response.statusCode == 200) {
//   // If the call to the server was successful, parse the JSON.
//   return Post.fromJson(json.decode(response.body));
// } else {
//   // If that call was not successful, throw an error.
//   throw Exception('Failed to load post');
// }
//}


// Trial Code for On Device ML WIP
// Future<Null> _loadModel() async {
//   try {
//     const platform = const MethodChannel('tushar/tensorflow');

//     var jsonString = await rootBundle.loadString('assets/traffic_signs_model.tflite');
//     var metaData = json.decode(jsonString);
//     labels = metaData["labels"];
//     colors = metaData["colors"];
//     metaData["blockSize"] = 32;
//     metaData["threshold"] = 0.5;
//     metaData["overlap_threshold"] = 0.7;
//     metaData["max_result"] = 15;

//     final String result = await platform.invokeMethod('loadModel',
//         {"modal_path": "assets/traffic_signs_model.tflite"});
//     print(result);
//   } on PlatformException catch (e) {
//     print('Error: $e.code\nError Message: $e.message');
//   }
// }

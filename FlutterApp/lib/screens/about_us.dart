import 'package:flutter/material.dart';
import 'package:traffic_sign_identity/common_widgets/tile_text.dart';

class AboutUs extends StatelessWidget {
  final String description =
      "DeepLearning Project to classify traffic and road signs using CNN classifier";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //bottomOpacity: 0.1,
        //backgroundColor: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Opacity(
            opacity: 0.4,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.blueGrey, BlendMode.dstATop),
                  image: AssetImage("assets/images/AboutUs.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 300,
              child: TileText(
                tileTitle: 'RoadNTraffic-Sign-Classifier',
                tileDesc: this.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

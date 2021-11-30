import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traffic_sign_identity/common_widgets/text_view.dart';
import 'package:traffic_sign_identity/models/MenuData.dart';

class HomeScreen extends StatelessWidget {
  final List<MenuData> menuData = MenuData.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[..._homeButtons(context)],
        ),
      ),
    );
  }

  List<Widget> _homeButtons(BuildContext context) {
    final List<Widget> widgets = [];
    for (var i = 0; i < menuData.length; i++) {
      widgets.add(Container(
        height: 300.0,
        child: Stack(
          children: <Widget>[
            Ink.image(
              image: AssetImage(menuData[i].assetPath),
              fit: BoxFit.cover,
              child: InkWell(
                highlightColor: Colors.black.withOpacity(0.5),
                onTap: () =>_onTileTap(context,menuData[i].navigatorPath),
                child: TextView(menuData[i]),
              ),
            ),
          ],
        ),
      ));
    }
    print(widgets.length);
    return widgets;
  }

  _onTileTap(BuildContext context,String routeName){
      Navigator.pushNamed(context, routeName);
  }
}

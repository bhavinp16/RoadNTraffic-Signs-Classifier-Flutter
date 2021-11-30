import 'package:flutter/material.dart';
import 'package:traffic_sign_identity/models/MenuData.dart';

class TextView extends StatelessWidget {
  final MenuData menuData;

  TextView(this.menuData);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.black.withOpacity(0.6),
          height: 60.0,
          padding: EdgeInsets.fromLTRB(10.0, 23.0, 10.0, 0.0),
          child: Text(
            menuData.displayName,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

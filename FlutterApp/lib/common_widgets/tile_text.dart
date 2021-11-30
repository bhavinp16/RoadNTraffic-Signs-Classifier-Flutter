import 'package:flutter/widgets.dart';

class TileText extends StatelessWidget {
  final String tileTitle;
  final String titleImagePath;
  final String tileDesc;
  final double descContainerHeight;

  TileText(
      {this.tileTitle,
      this.titleImagePath,
      this.tileDesc,
      this.descContainerHeight});

  @override
  Widget build(BuildContext context) {
   
    return Column(
    
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Text(
            this.tileTitle,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 26,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 20, 10, 0),
          child: Text(this.tileDesc,style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}

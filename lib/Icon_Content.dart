import 'package:flutter/material.dart';

import 'Constants.dart';

//class IconContent widget instance for icons

class IconContent extends StatelessWidget {
  final IconData icons;
  final String txt;

  IconContent({@required this.icons, this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(txt, style: ktxtStyle)
      ],
    );
  }
}

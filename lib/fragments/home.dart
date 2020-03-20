import 'package:flutter/material.dart';
import 'package:room_booking/i18n/app_localization.dart';

import '../pages/camera_route.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(AppLocalization.of(context).title),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Center(
            child: RaisedButton(
              child: Text(AppLocalization.of(context).cameraRouteTitle),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CameraRoute()));
              },
            ),
          ),
        )
      ],
    );
  }
}
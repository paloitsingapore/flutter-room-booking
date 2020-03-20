import 'package:flutter/material.dart';
import 'package:room_booking/i18n/app_localization.dart';

import 'camera_route.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Booking'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: RaisedButton(
                    onPressed: () {
                      setState(() {
                        AppLocalization.load(Locale('en', 'US'));
                      });
                    },
                    child: Text('ENGLISH'),
                  ),
                  trailing: RaisedButton(
                    onPressed: () {
                      setState(() {
                        AppLocalization.load(Locale('fr', 'FR'));
                      });
                    },
                    child: Text('FRENCH'),
                  ),
                ),
              ),
            ],
          ),
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
      ),
    );
  }
}

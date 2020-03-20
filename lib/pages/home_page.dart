import 'package:flutter/material.dart';
import 'package:room_booking/i18n/app_localization.dart';
import 'package:room_booking/pages/drawer_menu.dart';

import '../fragments/home.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  refresh() => {
    setState(() {})
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Booking'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(this.refresh),
      body: Home(),
    );
  }
}

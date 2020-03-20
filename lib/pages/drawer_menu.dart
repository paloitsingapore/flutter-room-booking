import 'package:flutter/material.dart';
import 'package:room_booking/i18n/app_localization.dart';

class DrawerMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerMenu();
}

class _DrawerMenu extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              AppLocalization.of(context).menuTitle,
              style: TextStyle(
                color: Colors.white
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            title: Text(AppLocalization.of(context).french),
            onTap: () {
              setState(() {
                AppLocalization.load(Locale('fr', 'FR'));
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(AppLocalization.of(context).english),
            onTap: () {
              setState(() {
                AppLocalization.load(Locale('en', 'US'));
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
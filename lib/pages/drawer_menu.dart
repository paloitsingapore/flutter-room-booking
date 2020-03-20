import 'package:flutter/material.dart';
import 'package:room_booking/i18n/app_localization.dart';

class DrawerMenu extends StatefulWidget {
  final Function notifyParent;

  DrawerMenu(this.notifyParent);

  @override
  State<StatefulWidget> createState() => _DrawerMenu();
}

class _DrawerMenu extends State<DrawerMenu> {
  setLocale(Locale locale) {
    setState(() {
      AppLocalization.load(locale);
      this.widget.notifyParent();
    });
  }

  Widget languageOption(String label, String languageCode, String countryCode) {
    return ListTile(
      title: Text(
        label,
      ),
      onTap: () {
        this.setLocale(Locale(languageCode, countryCode));
        Navigator.pop(context);
      },
    );
  }

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
          languageOption(AppLocalization.of(context).french, 'fr', 'FR'),
          languageOption(AppLocalization.of(context).english, 'en', 'US'),
        ],
      ),
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './locale/messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: 'Label for French language',
    );
  }

  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'Label for English language',
    );
  }

  String get menuTitle {
    return Intl.message(
      'Menu',
      name: 'menuTitle',
      desc: 'Title of the menu, appearing when opening the drawer menu',
    );
  }

  String get title {
    return Intl.message(
      'Hello Boy',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get cameraRouteTitle {
    return Intl.message(
      'Camera',
      name: 'cameraRouteTitle',
      desc: 'Title for camera route',
    );
  }

  String get savePhotoConfirmation {
    return Intl.message(
      'Photo has been saved in the gallery',
      name: 'savePhotoConfirmation',
      desc:
          'Message in the snackbar when the user takes a photo and it\'s actually saved in the gallery',
    );
  }
}

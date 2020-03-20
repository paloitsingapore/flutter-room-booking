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

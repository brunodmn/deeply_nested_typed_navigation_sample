import 'dart:async';

import 'package:flutter/material.dart';

import '../models/app.dart';

class ApiRepo {
  final apps = <App>[
    App(id: '0', name: 'APP0', activeSubscribers: 5),
    App(id: '1', name: 'APP1', activeSubscribers: 1325),
    App(id: '2', name: 'APP2', activeSubscribers: 700)
  ];

  Future<List<App>> getApps() =>
      Future.delayed(Durations.extralong1).then((value) => apps);

  Future<App?> getApp(String id) =>
      Future.delayed(Durations.extralong1).then((value) {
        final index = apps.indexWhere((element) => element.id == id);
        return index > -1 ? apps[index] : null;
      });
}

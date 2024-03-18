import 'dart:async';

import 'package:flutter/material.dart';

import '../models/user.dart';

class AuthRepo {
  User? _user;

  User? get currentUser => _user;
  final StreamController<User?> _authStateChangesController =
      StreamController<User?>();

  Stream<User?> get authStateChanges => _authStateChangesController.stream;

  Future<void> login() async {
    await Future.delayed(Durations.extralong4);
    _user = User(id: '1', name: 'Bruno', age: 22);
    _authStateChangesController.add(_user);
  }

  Future<void> logout() async {
    await Future.delayed(Durations.extralong4);
    _user = null;
    _authStateChangesController.add(null);
  }
}

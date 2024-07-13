import 'dart:convert';
import 'package:duofinance/core/entities/User.entity.dart';
import 'package:duofinance/utils/session_storage.dart';
import 'package:flutter/material.dart';

class Session with ChangeNotifier {
  static final Session _instance = Session._();
  late final BuildContext context;
  late bool isLoggedIn;
  IUser? user;

  Session._();

  factory Session(bool isLoggedIn, IUser? user) {
    _instance.isLoggedIn = isLoggedIn;
    _instance.user = user;
    return _instance;
  }

  logIn(IUser incomingUser) async {
    user = incomingUser;
    await saveUserData(incomingUser);
    isLoggedIn = true;
    notifyListeners();
  }

  saveUserData(IUser user) async {
    await writeInStorage(
        key: StorageKeys.user,
        value: jsonEncode(<String, Object?>{
          'id': user.id,
          'name': user.name,
          'email': user.email,
        }));
  }

  logOut() async {
    await logout();
    isLoggedIn = false;
    notifyListeners();
  }
}

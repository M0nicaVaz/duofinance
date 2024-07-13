import 'dart:async';
import 'dart:convert';
import 'package:duofinance/core/entities/User.entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageKeys {
  static const String token = "@user:token";
  static const String user = "@user:userData";
}

Future<String?> getFromStorage({required String key}) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  final String? userToken = await storage.read(key: key);
  return userToken;
}

Future<void> writeInStorage(
    {required String key, required String value}) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  await storage.write(key: key, value: value);
}

Future<void> removeFromStorage({required String key}) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  await storage.delete(key: key);
}

Future<void> logout() async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  await storage.delete(key: StorageKeys.token);
  await storage.delete(key: StorageKeys.user);
}

Future<IUser?> getUserFromStorage() async {
  final String? json = await getFromStorage(key: StorageKeys.user);

  if (json != null) {
    final dynamic userData = jsonDecode(json);
    return IUser(
      id: userData['id'],
      name: userData['name'],
      email: userData['email'],
    );
  }

  return null;
}

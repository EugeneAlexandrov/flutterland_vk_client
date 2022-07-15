import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefModel {
  final _storage = SharedPreferences.getInstance();
  final keyTextController = TextEditingController();
  final valueTextController = TextEditingController();

  String value = '';

  Future<void> readKeyValue() async {
    final storage = await _storage;
    value = storage.getString(keyTextController.text) ??
        'такого значения не обнаружено';
  }

  Future<void> setKeyValue() async {
    final storage = await _storage;
    await storage.setString(keyTextController.text, valueTextController.text);
  }
}

import 'package:flutter/material.dart';
import 'package:flutterland_vk_client/presentation/authorisation/screen.dart';
import 'package:flutterland_vk_client/presentation/main_screen/screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'TEST_ENTRY_POINT_1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    ),
  );
}

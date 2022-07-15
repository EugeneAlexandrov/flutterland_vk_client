import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterland_vk_client/test/shared_pref_service/locatorTest.dart';
import 'package:flutterland_vk_client/test/shared_pref_service/screen.dart';

void main() {
  runApp(
    FutureBuilder(
      future: setupLocatorTwo(),
      builder: (context, snapshot) {
        return const BottomBarApp();
      },
    ),
  );
}

class BottomBarApp extends StatelessWidget {
  const BottomBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KeyValueScreenWidget(),
    );
  }
}
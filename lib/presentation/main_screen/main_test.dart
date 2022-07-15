import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterland_vk_client/presentation/main_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/main_screen/state.dart';
import 'package:get_it/get_it.dart';


import '../../core/locator.dart';
import 'cubit.dart';

void main() {

  runApp(FutureBuilder(
    future: setupLocator(),
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
      home: const MainScreenBottomNavBar(),
    );
  }
}
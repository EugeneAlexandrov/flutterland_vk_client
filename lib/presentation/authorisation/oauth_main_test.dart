import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterland_vk_client/presentation/authorisation/oauth_screen.dart';

import '../../core/locator.dart';

void main() {

  runApp(FutureBuilder(
    future: setupLocator(),
    builder: (context, snapshot) {
      return const AuthScreenTest();
    },
  ),
  );
}
class AuthScreenTest extends StatelessWidget {
  const AuthScreenTest({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Bar',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    );
  }
}
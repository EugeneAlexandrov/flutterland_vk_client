import 'package:flutter/material.dart';
import 'package:flutterland_vk_client/core/locator.dart';
import 'package:flutterland_vk_client/test/screen_and_block_example/presentation/screen.dart';

void main() {
  runApp(
    FutureBuilder(
      future: setupLocator(),
      builder: (context, snapshot) {
        return const ExampleApp();
      },
    ),
  );
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'screen_and_block_example',
      onGenerateRoute: (_) => ExampleScreen.route(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        if (!isLocatorInitialized) {
          return Container();
        }
        return Scaffold(
          backgroundColor: const Color(0xFF333333),
          body: child ?? Container(),
        );
      },
    );
  }
}

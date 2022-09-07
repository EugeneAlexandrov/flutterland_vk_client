import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterland_vk_client/presentation/main_screen/screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? _token;
  String? _iD;

  void readResponse(String value) {
    if (value.contains('access_token=')) {
      final str = value;
      const startToken = "token=";
      const endToken = "&expires";
      const startId = "user_id=";
      const endId = "&state";

      final startTokenIndex = str.indexOf(startToken);
      final endTokenIndex =
          str.indexOf(endToken, startTokenIndex + startToken.length);
      final token =
          str.substring(startTokenIndex + startToken.length, endTokenIndex);

      final startIdIndex = str.indexOf(startId);
      final endIdIndex = str.indexOf(endId, startTokenIndex + startId.length);
      final iD = str.substring(startIdIndex + startId.length, endIdIndex);

      _token = token;
      _iD = iD;
    } else {
      log('Error token response');
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 500,
                width: 400,
                child: WebView(
                  initialUrl:
                      'https://oauth.vk.com/authorize?client_id=8212104&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.131&state=123456',
                  onWebViewCreated: (WebViewController controller) {
                    // _controller = controller;
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureNavigationEnabled: true,
                  onPageStarted: (value) {
                    log('page started: $value');
                  },

                  onPageFinished: (value) {
                    readResponse(value);
                    if (_token != null && _iD != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MainScreenBottomNavBar(),
                        ),
                      );

                    }
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


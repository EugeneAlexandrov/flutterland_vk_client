import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/core/locator.dart';


import 'package:flutterland_vk_client/presentation/authorisation/auth_cubit.dart';
import 'package:flutterland_vk_client/presentation/authorisation/auth_state.dart';
import 'package:flutterland_vk_client/presentation/main_screen/screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/cupertino.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //locator.get<AuthCubit>().initState();
    locator.get<AuthCubit>().onAuthScreenStarted();

    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: locator.get<AuthCubit>(),
        builder: (context, state) {
          if (state.isTokenAvailable) {
            return const MainScreenBottomNavBar();
          } else {
            return AuthWebView(
              isLogout: state.isLogout,
            );
          }
        },
      ),
    );
  }
}

class AuthWebView extends StatelessWidget {
  final bool isLogout;

  const AuthWebView({
    Key? key,
    required this.isLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('webview was build');

    return WebView(
      initialUrl: locator.get<AuthCubit>().getInitialUrl(),
      onWebViewCreated: (WebViewController controller) {
        locator.get<AuthCubit>().getController().complete(controller);
        if (isLogout) {
          controller.clearCache();
          final cookieManager = CookieManager();
          cookieManager.clearCookies();
          controller.reload();
        }
      },
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onPageStarted: (value) {
        log('он пейдж стартед');
      },
      onPageFinished: (value) {
        log('он пейдж финишед');
        locator.get<AuthCubit>().onAuthPageFinished(value);
      },
    );
  }
}

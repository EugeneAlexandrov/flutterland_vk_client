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
    locator.get<AuthCubit>().initState();

    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: locator.get<AuthCubit>(),
        builder: (context, state) {
          if (state.isTokenAvailable) {
            return const MainScreenBottomNavBar();
          } else {
            return const AuthWebView();
          }
        },
      ),
    );
  }
}

class AuthWebView extends StatelessWidget {
  const AuthWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 500,
              width: 400,
              child: WebView(
                initialUrl: locator.get<AuthCubit>().authRepo.initialUrl,
                onWebViewCreated: (WebViewController controller) {
                  // _controller = controller;
                },
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                onPageStarted: (value) {},
                onPageFinished: (value) {
                  locator.get<AuthCubit>().onAuthPageFinished(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

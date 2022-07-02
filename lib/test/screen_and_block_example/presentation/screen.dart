import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/core/locator.dart';
import 'package:flutterland_vk_client/test/screen_and_block_example/presentation/cubit.dart';
import 'package:flutterland_vk_client/test/screen_and_block_example/presentation/state.dart';

class ExampleScreen extends StatelessWidget {
  static const name = "ExampleScreen";

  const ExampleScreen({Key? key}) : super(key: key);

  //TODO: Вынести, для переиспользования во всех экранах.
  static Route route() {
    return PageRouteBuilder<dynamic>(
      settings: const RouteSettings(name: name),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return const ExampleScreen();
      },
      transitionDuration: const Duration(milliseconds: 666),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) => FadeTransition(opacity: animation, child: child),
    );
  }

  void _onTap(BuildContext context) {
    locator.get<ExampleCubit>().onTapContainer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ExampleCubit, ExampleState>(
          bloc: locator.get<ExampleCubit>(),
          builder: (context, state) {
            return GestureDetector(
              onTap: () => _onTap(context),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 100 * (state.isActivated ? 2 : 1),
                height: 100 * (state.isActivated ? 2 : 1),
                color: state.isActivated ? Colors.redAccent : Colors.blueAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}

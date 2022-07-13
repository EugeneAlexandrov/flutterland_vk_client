import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutterland_vk_client/presentation/friends_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/main_screen/cubit.dart';
import 'package:flutterland_vk_client/presentation/main_screen/state.dart';
import 'package:flutterland_vk_client/presentation/news_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/user_page_screen/screen.dart';

import '../../core/locator.dart';

class MainScreenBottomNavBar extends StatelessWidget {
  const MainScreenBottomNavBar({Key? key}) : super(key: key);

  final List<Widget> _pages = const [
    UserPageScreenWidget(),
    FriendsScreenWidget(),
    NewsScreenWidget(),
  ];

  void _onItemTapped(int index) {
    locator.get<BottomNavCubit>().onTapContainer(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavScreenState>(
        bloc: locator.get<BottomNavCubit>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Main Screen')),
            body: _pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Моя страница',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Друзья',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'Новости',
                ),
              ],
              currentIndex: state.selectedIndex,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}

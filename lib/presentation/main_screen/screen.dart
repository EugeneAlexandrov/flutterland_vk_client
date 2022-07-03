import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterland_vk_client/presentation/friends_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/news_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/user_page_screen/screen.dart';

class MainScreenBottomNavBar extends StatefulWidget {
  const MainScreenBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainScreenBottomNavBar> createState() => _MainScreenBottomNavBarState();
}

class _MainScreenBottomNavBarState extends State<MainScreenBottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> mainScreenNavigationList = const [
    UserPageScreenWidget(),
    FriendsScreenWidget(),
    NewsScreenWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: mainScreenNavigationList[_selectedIndex],
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

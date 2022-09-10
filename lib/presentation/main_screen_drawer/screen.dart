import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterland_vk_client/presentation/friends_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/news_screen/screen.dart';
import 'package:flutterland_vk_client/presentation/user_page_screen/user_page_screen.dart';

class MainScreenDrawer extends StatefulWidget {
  const MainScreenDrawer({Key? key}) : super(key: key);

  @override
  State<MainScreenDrawer> createState() => _MainScreenDrawerState();
}

class _MainScreenDrawerState extends State<MainScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: const Text('My Page'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserPageScreenWidget(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Friends'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FriendsScreenWidget(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('News'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewsScreenWidget(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text('Main Screen')),
      body: const Center(
        child: Text('Push the stripes'),
      ),
    );
  }
}

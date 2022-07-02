import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'TEST_ENTRY_POINT_1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestEntryPoint1(),
    ),
  );
}

class TestEntryPoint1 extends StatelessWidget {
  const TestEntryPoint1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VK TEST_ENTRY_POINT_1'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Войти')),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Авторизоваться')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/core/locator.dart';

import 'package:flutterland_vk_client/presentation/user_page_screen/user_page_cubit.dart';
import 'package:flutterland_vk_client/presentation/user_page_screen/user_page_state.dart';

import '../../data/models/profile_model.dart';

class UserPageScreenWidget extends StatelessWidget {
  const UserPageScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator.get<UserPageCubit>().initState();
    return Scaffold(
      body: BlocBuilder<UserPageCubit, UserPageState>(
          bloc: locator.get<UserPageCubit>(),
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (state.isResponseLoading)
                  const Center(
                    child: LinearProgressIndicator(),
                  ),
                state.userInfo != null
                    ? UserInfoWidget(
                        user: state.userInfo!,
                      )
                    : const Center(child: Text('zzzz...')),
              ],
            );
          }),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  final User user;

  const UserInfoWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: Image.network(
                  '${user.photo}',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('День рождения: ${user.bdate}'),
              const SizedBox(
                height: 8,
              ),
              Text('Страна: ${user.country?.title}'),
              const SizedBox(
                height: 8,
              ),
              Text('Город: ${user.city?.title}'),
            ],
          ),
        ],
      ),
    );
  }
}

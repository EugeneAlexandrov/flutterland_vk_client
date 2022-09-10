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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (state.isResponseLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                state.userInfo != null
                    ? UserInfoWidget(
                        user: state.userInfo!,
                      )
                    : const Center(child: Text('zzzz...'))
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
    return Center(
      child: Column(
        children: [
          Text('${user.firstName}'),
          Text('${user.lastName}'),
          Text('${user.bdate}'),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/test/shared_pref_service/locatorTest.dart';
import 'package:flutterland_vk_client/test/shared_pref_service/state.dart';

import 'cubit.dart';
import 'model.dart';

class KeyValueScreenWidget extends StatelessWidget {
  const KeyValueScreenWidget({Key? key}) : super(key: key);

  void _saveKeyValue() {
    locatorTwo.get<SharedPrefCubit>().onTap();
    locatorTwo.get<SharedPrefModel>().setKeyValue();
  }

  void _readKeyValue() {
    locatorTwo.get<SharedPrefModel>().readKeyValue();
    locatorTwo.get<SharedPrefCubit>().getValue();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefCubit, SharedPrefState>(
        bloc: locatorTwo.get<SharedPrefCubit>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Shared Preferences Service Test'),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 56, left: 24, right: 24),
              child: ListView(
                children: [
                  TextField(
                    controller:
                    locatorTwo.get<SharedPrefModel>().keyTextController,
                    //locatorTwo.get<SharedPrefCubit>().keyTextController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Ключ'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller:
                    locatorTwo.get<SharedPrefModel>().valueTextController,
                    //locatorTwo.get<SharedPrefCubit>().valueTextController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Значение'),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: _saveKeyValue,
                    child: const Text('Сохранить ключ и значение'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: _readKeyValue,
                    child: const Text('Получить значение'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Ключ: ${state.key}'),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Последнее сохраненное значение: ${state.value}'),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Значение : ${locatorTwo.get<SharedPrefModel>().value}'),
                ],
              ),
            ),
          );
          ;
        });
  }
}

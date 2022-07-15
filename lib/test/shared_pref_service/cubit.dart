import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/test/shared_pref_service/state.dart';

import 'locatorTest.dart';
import 'model.dart';

class SharedPrefCubit extends Cubit<SharedPrefState> {
  SharedPrefCubit() : super(const SharedPrefState.initial());

  void onTap() {
    emit(state.copyWith(
      key: locatorTwo.get<SharedPrefModel>().keyTextController.text,
      value: locatorTwo.get<SharedPrefModel>().valueTextController.text,
    ));
  }

  void getValue() {
    emit(state.copyWith(
      key: locatorTwo.get<SharedPrefModel>().keyTextController.text,
      value: locatorTwo.get<SharedPrefModel>().value,
    ));
  }
}
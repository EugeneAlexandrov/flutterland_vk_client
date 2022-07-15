import 'package:flutterland_vk_client/test/shared_pref_service/model.dart';
import 'package:flutterland_vk_client/test/shared_pref_service/state.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit.dart';

final GetIt locatorTwo = GetIt.instance;

bool isLocatorInitialized = false;

Future setupLocatorTwo() async {
  await locatorTwo.reset();
  _setupServices();
  _setupBlocs();
  isLocatorInitialized = true;

  return isLocatorInitialized;
}

void _setupServices() {
  //TODO: initialize HttpClient
  //TODO: initialize SharedPreferencesService

  locatorTwo.registerSingleton(SharedPrefModel());
}

void _setupBlocs() {
  locatorTwo.registerSingleton(SharedPrefCubit());
}

void resetLocator() {}

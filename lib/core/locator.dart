import 'package:flutterland_vk_client/core/services/http_client.dart';
import 'package:flutterland_vk_client/core/services/shared_preferences_service.dart';
import 'package:flutterland_vk_client/data/repositories/auth_repo.dart';
import 'package:flutterland_vk_client/data/repositories/user_page_repo.dart';
import 'package:flutterland_vk_client/presentation/authorisation/auth_cubit.dart';
import 'package:flutterland_vk_client/presentation/user_page_screen/user_page_cubit.dart';

import 'package:get_it/get_it.dart';

import '../presentation/main_screen/cubit.dart';

final GetIt locator = GetIt.instance;
bool isLocatorInitialized = false;

Future setupLocator() async {
  await locator.reset();
  _setupServices();
  _setupRepositories();
  _setupBlocs();

  isLocatorInitialized = true;
  return isLocatorInitialized;
}

void _setupServices() {
  locator.registerSingleton(HttpClientService());
  locator.registerSingleton(SharedPreferencesService());
}

void _setupBlocs() {
  locator.registerSingleton(BottomNavCubit());

  locator.registerSingleton(AuthCubit(
    authRepo: locator.get(),
    sharedPreferencesService: locator.get(),
  ));
  locator.registerSingleton(UserPageCubit(
    userRepo: locator.get(),
  ));
}

void _setupRepositories() {
  locator.registerSingleton(
    AuthRepo(
      httpClient: locator.get(),
      sharedPreferencesService: locator.get(),
    ),
  );
  locator.registerSingleton(UserRepo(
    httpClient: locator.get(),
    sharedPreferencesService: locator.get(),
  ));
}

void resetLocator() {}

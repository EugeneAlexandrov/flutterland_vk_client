import 'package:flutterland_vk_client/core/services/http_client.dart';
import 'package:flutterland_vk_client/core/services/shared_preferences_service.dart';
import 'package:flutterland_vk_client/data/repositories/oauth_repo.dart';
import 'package:flutterland_vk_client/presentation/authorisation/oauth_cubit.dart';

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
  locator.registerSingleton(AuthCubit(authRepo: locator.get()));
}

void _setupRepositories() {
  locator.registerSingleton(
    AuthRepo(
      httpClient: locator.get(),
      sharedPreferencesService: locator.get(),
    ),
  );
}

void resetLocator() {}

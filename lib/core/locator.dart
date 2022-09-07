
import 'package:flutterland_vk_client/core/services/http_client.dart';
import 'package:flutterland_vk_client/core/services/shared_preferences_service.dart';
import 'package:flutterland_vk_client/test/screen_and_block_example/presentation/cubit.dart';
import 'package:get_it/get_it.dart';

import '../presentation/main_screen/cubit.dart';

final GetIt locator = GetIt.instance;
bool isLocatorInitialized = false;

Future setupLocator() async {
  await locator.reset();
  _setupServices();
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


void resetLocator() {
  locator.resetLazySingleton<BottomNavCubit>();
}
}

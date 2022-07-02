import 'package:flutterland_vk_client/test/screen_and_block_example/presentation/cubit.dart';
import 'package:get_it/get_it.dart';

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
  //TODO: initialize HttpClient
  //TODO: initialize SharedPreferencesService
}

void _setupBlocs() {
  locator.registerSingleton(ExampleCubit());
}

void resetLocator() {
  locator.resetLazySingleton<ExampleCubit>();
}

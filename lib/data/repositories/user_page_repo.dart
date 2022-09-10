

import 'package:flutterland_vk_client/core/services/http_client.dart';
import 'package:flutterland_vk_client/core/services/shared_preferences_service.dart';

import '../models/profile_model.dart';

class UserRepo {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;

  UserRepo({required this.httpClient, required this.sharedPreferencesService});

  Future<User?> getUserInfo() async {
    final token = await sharedPreferencesService.getString(vkToken);
    final id = await sharedPreferencesService.getString(vkId);
    final response = await httpClient.executeGet(
        'https://api.vk.com/method/users.get?user_ids=$id&fields=bdate&access_token=$token&v=5.131');
    if (response.statusCode == 200) {
      final userInfo = UserInfoList.fromJson(response.data);

      return userInfo.response?.first;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

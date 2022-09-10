import 'dart:developer';

import 'package:flutterland_vk_client/core/services/http_client.dart';
import 'package:flutterland_vk_client/core/services/shared_preferences_service.dart';

class AuthRepo {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;
  final initialUrl =
      'https://oauth.vk.com/authorize?client_id=8212104&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=video&response_type=token&v=5.131&state=123456';
  String? _token;
  String? _iD;

  String? get token => _token;

  String? get id => _iD;

  AuthRepo({
    required this.httpClient,
    required this.sharedPreferencesService,
  });

  void readResponse(String value) {
    if (value.contains('access_token=')) {
      final str = value;
      const startToken = "token=";
      const endToken = "&expires";
      const startId = "user_id=";
      const endId = "&state";

      final startTokenIndex = str.indexOf(startToken);
      final endTokenIndex =
          str.indexOf(endToken, startTokenIndex + startToken.length);
      final token =
          str.substring(startTokenIndex + startToken.length, endTokenIndex);

      final startIdIndex = str.indexOf(startId);
      final endIdIndex = str.indexOf(endId, startTokenIndex + startId.length);
      final iD = str.substring(startIdIndex + startId.length, endIdIndex);

      _token = token;
      _iD = iD;

      if (_token != null && _iD != null) {
        sharedPreferencesService.setString(vkToken, _token!);
        sharedPreferencesService.setString(vkId, _iD!);
        sharedPreferencesService.setBool(access, true);
      }
    } else {
      log('Error token response');
    }
  }

  Future<bool> getAccess() {
    return sharedPreferencesService.getBool(access).then((value) => value!);
  }
}

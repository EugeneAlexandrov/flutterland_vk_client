
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterland_vk_client/presentation/authorisation/auth_state.dart';

import '../../core/services/shared_preferences_service.dart';
import '../../data/repositories/oauth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final SharedPreferencesService sharedPreferencesService;

  AuthCubit({
    required this.authRepo,
    required this.sharedPreferencesService,
  }) : super(const AuthState.initial());

  void onAuthPageFinished(String value) {
    authRepo.readResponse(value);

    if (authRepo.token != null && authRepo.id != null) {
      emit(state.copyWith(isTokenAvailable: true));
    }
  }

  void initState() {
    authRepo
        .getAccess()
        .then((value) => emit(state.copyWith(isTokenAvailable: value)));
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/presentation/authorisation/oauth_state.dart';

import '../../data/repositories/oauth_repo.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit({
    required this.authRepo,
  }) : super(const AuthState.initial());

  void onAuthPageFinished(String value) {
    authRepo.readResponse(value);

    if (authRepo.token != null && authRepo.id != null) {
      emit(state.copyWith(isTokenAvailable: true));
    }
  }
}

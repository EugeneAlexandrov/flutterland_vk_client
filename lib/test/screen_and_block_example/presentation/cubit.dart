import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterland_vk_client/test/screen_and_block_example/presentation/state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(const ExampleState.initial());

  void onTapContainer() {
    emit(state.copyWith(isActivated: !state.isActivated));
  }
}

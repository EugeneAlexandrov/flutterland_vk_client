import 'package:equatable/equatable.dart';
import 'package:flutterland_vk_client/data/models/profile_model.dart';

class UserPageState extends Equatable {
  final bool isResponseLoading;
  final User? userInfo;

  const UserPageState._({
    this.isResponseLoading = false,
    this.userInfo,
  });

  const UserPageState.initial() : this._(isResponseLoading: false);

  UserPageState copyWith({
    bool? isResponseLoading,
    User? userInfo,
  }) {
    return UserPageState._(
      isResponseLoading: isResponseLoading ?? this.isResponseLoading,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [
        isResponseLoading,
        userInfo,
      ];
}

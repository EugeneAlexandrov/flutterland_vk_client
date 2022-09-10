import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isTokenAvailable;


  const AuthState._({
    this.isTokenAvailable = false,

  });

  const AuthState.initial() : this._(isTokenAvailable: false);

  AuthState copyWith({
    bool? isTokenAvailable,

  }) {
    return AuthState._(
      isTokenAvailable: isTokenAvailable ?? this.isTokenAvailable,

    );
  }

  @override
  List<Object?> get props => [
    isTokenAvailable,
      ];
}

import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isTokenAvailable;
  final String? token;
  final String? id;

  const AuthState._({
    this.isTokenAvailable = false,
    this.token,
    this.id,
  });

  const AuthState.initial() : this._(isTokenAvailable: false);

  AuthState copyWith({
    bool? isTokenAvailable,
    String? token,
    String? id,
  }) {
    return AuthState._(
      isTokenAvailable: isTokenAvailable ?? this.isTokenAvailable,
      token: token ?? this.token,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        token,
        id,
      ];
}

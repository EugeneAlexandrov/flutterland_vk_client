import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SharedPrefState extends Equatable {
  final String key;
  final String value;

  const SharedPrefState._({required this.key, required this.value});

  const SharedPrefState.initial() : this._(key: '', value: '');

  SharedPrefState copyWith({dynamic key, dynamic value}) {
    return SharedPrefState._(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    key,
    value,
  ];
}

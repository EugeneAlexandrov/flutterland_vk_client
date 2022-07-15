import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../friends_screen/screen.dart';
import '../news_screen/screen.dart';
import '../user_page_screen/screen.dart';

class BottomNavScreenState extends Equatable {
  final int selectedIndex;

  const BottomNavScreenState._({
    required this.selectedIndex,
  });

  const BottomNavScreenState.initial() : this._(selectedIndex: 0);

  BottomNavScreenState copyWith({
    dynamic selectedIndex,
  }) {
    return BottomNavScreenState._(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [
    selectedIndex,
  ];
}
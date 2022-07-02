import 'package:equatable/equatable.dart';

class ExampleState extends Equatable {
  final bool isActivated;

  const ExampleState._({
    required this.isActivated,
  });

  const ExampleState.initial() : this._(isActivated: false);

  ExampleState copyWith({
    dynamic isActivated,
  }) {
    return ExampleState._(
      isActivated: isActivated ?? this.isActivated,
    );
  }

  @override
  List<Object?> get props => [
        isActivated,
      ];
}

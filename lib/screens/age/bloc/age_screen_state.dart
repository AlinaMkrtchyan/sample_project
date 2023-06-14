import 'package:equatable/equatable.dart';
import 'package:task_project/screens/age/age_enum.dart';

abstract class AgeScreenState extends Equatable {
  const AgeScreenState();

  @override
  List<Object> get props => [];
}

class AgeInitState extends AgeScreenState {}

class AgeRangeSelectedState extends AgeScreenState {
  const AgeRangeSelectedState({required this.ageRange});

  final AgeRange ageRange;

  @override
  List<Object> get props => [ageRange];
}

class AgeRangeRemovedState extends AgeScreenState {}

class AgeRangeSavedState extends AgeScreenState {
  const AgeRangeSavedState({required this.ageRange});

  final AgeRange ageRange;

  @override
  List<Object> get props => [ageRange];
}

import 'package:equatable/equatable.dart';
import 'package:sample_project/screens/age/age_enum.dart';

abstract class AgeScreenEvent extends Equatable {
  const AgeScreenEvent();

  @override
  List<Object> get props => [];
}

class SelectAgeRangeEvent extends AgeScreenEvent {
  const SelectAgeRangeEvent({required this.ageRange});

  final AgeRange ageRange;

  @override
  List<Object> get props => [ageRange];
}

class SaveAgeRangeEvent extends AgeScreenEvent {}

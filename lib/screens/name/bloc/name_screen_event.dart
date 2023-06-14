import 'package:equatable/equatable.dart';

abstract class NameScreenEvent extends Equatable {
  const NameScreenEvent();

  @override
  List<Object> get props => [];
}

class SaveNameEvent extends NameScreenEvent {}

class NameChangeEvent extends NameScreenEvent {
  const NameChangeEvent({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

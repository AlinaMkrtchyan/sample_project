import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NameScreenState extends Equatable {
  const NameScreenState();

  @override
  List<Object> get props => [];
}

class NameInitState extends NameScreenState {}

class NameSavedState extends NameScreenState {
  @override
  List<Object> get props => [UniqueKey()];
}

class NameInvalidState extends NameScreenState {}

class NameChangedState extends NameScreenState {}

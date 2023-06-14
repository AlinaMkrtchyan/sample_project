import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/screens/name/bloc/name_screen_event.dart';
import 'package:task_project/screens/name/bloc/name_screen_state.dart';
import 'package:task_project/shared/repositories/user_repository.dart';

class NameScreenBloc extends Bloc<NameScreenEvent, NameScreenState> {
  NameScreenBloc({required this.repository}) : super(NameInitState()) {
    on<SaveNameEvent>(_onSaveNameEvent);
    on<NameChangeEvent>(_onNameChangeEvent);
  }

  final UserRepository repository;
  String _name = '';

  Future<void> _onSaveNameEvent(
      SaveNameEvent event, Emitter<NameScreenState> emitter) async {
    if (_name.isNotEmpty) {
      await repository.applyName(_name);

      emitter(NameSavedState());
    } else {
      emitter(NameInvalidState());
    }
  }

  Future<void> _onNameChangeEvent(
      NameChangeEvent event, Emitter<NameScreenState> emitter) async {
    _name = event.name;
    if (_name.isEmpty) {
      emitter(NameInitState());
      return;
    }

    emitter(NameChangedState());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/screens/age/age_enum.dart';
import 'package:task_project/screens/age/bloc/age_screen_event.dart';
import 'package:task_project/screens/age/bloc/age_screen_state.dart';
import 'package:task_project/shared/repositories/user_repository.dart';

class AgeScreenBloc extends Bloc<AgeScreenEvent, AgeScreenState> {
  AgeScreenBloc({required this.userRepository}) : super(AgeInitState()) {
    on<SelectAgeRangeEvent>(_onSelectAgeRangeEvent);
    on<SaveAgeRangeEvent>(_onSaveAgeRangeEvent);
  }

  final UserRepository userRepository;
  AgeRange? _selectedRange;

  Future<void> _onSelectAgeRangeEvent(
      SelectAgeRangeEvent event, Emitter<AgeScreenState> emitter) async {
    if (_selectedRange == event.ageRange) {
      _selectedRange = null;

      emitter(AgeRangeRemovedState());
      return;
    }
    _selectedRange = event.ageRange;
    emitter(AgeRangeSelectedState(ageRange: event.ageRange));
  }

  Future<void> _onSaveAgeRangeEvent(
      SaveAgeRangeEvent event, Emitter<AgeScreenState> emitter) async {
    final age = _selectedRange;

    if (age != null) {
      await userRepository.applyAge(age.title);
      emitter(AgeRangeSavedState(ageRange: age));
    }
  }
}

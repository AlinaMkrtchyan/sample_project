import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sample_project/component/app_bar_widget.dart';
import 'package:sample_project/component/button_widget.dart';
import 'package:sample_project/component/title_widget.dart';
import 'package:sample_project/screens/age/age_range_screen.dart';
import 'package:sample_project/screens/age/bloc/age_screen_bloc.dart';
import 'package:sample_project/screens/name/bloc/name_screen_bloc.dart';
import 'package:sample_project/screens/name/bloc/name_screen_event.dart';
import 'package:sample_project/screens/name/bloc/name_screen_state.dart';
import 'package:sample_project/screens/name/form_field_widget.dart';
import 'package:sample_project/shared/constants/app_colors.dart';
import 'package:sample_project/shared/repositories/user_repository.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late NameScreenBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of<NameScreenBloc>(context, listen: false);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NameScreenBloc>(
      create: (_) => _bloc,
      child: BlocListener<NameScreenBloc, NameScreenState>(
        listener: _listener,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(showPrefix: false),
                  TitleWidget(
                      title: AppLocalizations.of(context)?.welcome ?? ''),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      AppLocalizations.of(context)?.whatShouldCallYou ?? '',
                      style: const TextStyle(
                        color: ColorAddition.woodsmokeColor,
                        fontSize: 16,
                        height: 24 / 16,
                      ),
                    ),
                  ),
                  FormFieldWidget(
                      title: AppLocalizations.of(context)?.yourName ?? ''),
                  ButtonWidget(
                      title: AppLocalizations.of(context)?.next ?? '',
                      buttonState: ButtonState.active,
                      onTap: _onTap)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension _NameScreenStateActions on _NameScreenState {
  void _listener(BuildContext context, NameScreenState state) {
    if (state is NameSavedState) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider<AgeScreenBloc>(
            create: (context) => AgeScreenBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
            child: const AgeRangeScreen(),
          ),
        ),
      );
    }
  }

  void _onTap() => _bloc.add(SaveNameEvent());
}

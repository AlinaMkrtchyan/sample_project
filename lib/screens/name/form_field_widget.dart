import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sample_project/component/mixins/theme_addition.dart';
import 'package:sample_project/screens/name/bloc/name_screen_bloc.dart';
import 'package:sample_project/screens/name/bloc/name_screen_event.dart';
import 'package:sample_project/screens/name/bloc/name_screen_state.dart';
import 'package:sample_project/shared/constants/app_colors.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> with ThemeAddition {
  late NameScreenBloc _bloc;
  String get _title => widget.title;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of<NameScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameScreenBloc, NameScreenState>(
      builder: (context, state) => BlocProvider<NameScreenBloc>.value(
        value: _bloc,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleWidget(title: _title),
            TextFormField(
                style: const TextStyle(
                    color: ColorAddition.woodsmokeColor,
                    fontSize: 16,
                    height: 24 / 16),
                onChanged: _onChanged,
                onFieldSubmitted: _onFieldSubmitted,
                textInputAction: TextInputAction.go,
                autofocus: true,
                scrollPadding: EdgeInsets.zero,
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    filled: true,
                    fillColor: ColorAddition.athensGrayColor,
                    focusedBorder: _border(state),
                    enabledBorder: _border(state),
                    border: _border(state))),
            _ErrorMessageWidget(isInvalid: state is NameInvalidState)
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _border(NameScreenState state) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: state is NameInvalidState
            ? ColorAddition.coralRedColor
            : state is NameInitState
                ? primaryColor
                : Colors.transparent,
        width: 2,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: ColorAddition.shipGreyColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({required this.isInvalid});

  final bool isInvalid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Text(
        AppLocalizations.of(context)?.enterName ?? '',
        style: TextStyle(
          color: isInvalid ? ColorAddition.coralRedColor : Colors.transparent,
          height: 20 / 14,
        ),
      ),
    );
  }
}

extension _ActionState on _FormFieldWidgetState {
  void _onChanged(value) => _bloc.add(NameChangeEvent(name: value));

  void _onFieldSubmitted(value) => _bloc.add(SaveNameEvent());
}

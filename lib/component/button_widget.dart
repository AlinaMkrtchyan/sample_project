import 'package:flutter/material.dart';
import 'package:task_project/component/mixins/theme_addition.dart';
import 'package:task_project/shared/constants/app_colors.dart';

class ButtonWidget extends StatelessWidget with ThemeStatelessAddition {
  const ButtonWidget(
      {required this.title,
      this.buttonState = ButtonState.inactive,
      this.onTap,
      Key? key})
      : super(key: key);

  final String title;
  final ButtonState buttonState;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = buttonState == ButtonState.active
        ? primaryColor(context)
        : ColorAddition.athensGrayColor;

    return InkWell(
      onTap: buttonState == ButtonState.active ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.only(bottom: 24),
        child: Text(
          title,
          style: TextStyle(
            color: buttonState.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 20 / 16,
          ),
        ),
      ),
    );
  }
}

extension _ButtonStateExtension on ButtonState {
  Color get titleColor {
    if (this == ButtonState.active) {
      return ColorAddition.whiteColor;
    }
    return ColorAddition.frenchGreyColor;
  }
}

enum ButtonState { active, inactive }

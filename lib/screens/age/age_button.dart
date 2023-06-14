import 'package:flutter/material.dart';
import 'package:task_project/component/mixins/theme_addition.dart';
import 'package:task_project/screens/age/age_enum.dart';
import 'package:task_project/shared/constants/app_colors.dart';

class AgeButton extends StatelessWidget with ThemeStatelessAddition {
  const AgeButton(
      {required this.age,
      required this.onTap,
      required this.isSelected,
      super.key});

  final AgeRange age;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isSelected
                ? ColorAddition.pauaColor
                : ColorAddition.blueChalkColor),
        child: _TextWidget(
          title: age.title,
          color: isSelected ? ColorAddition.whiteColor : primaryColor(context),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({required this.title, required this.color});

  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
        height: 20 / 16,
      ),
    );
  }
}

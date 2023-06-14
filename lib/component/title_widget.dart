import 'package:flutter/material.dart';
import 'package:task_project/shared/constants/app_colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {required this.title,
      this.padding = const EdgeInsets.only(top: 24, bottom: 4),
      Key? key})
      : super(key: key);
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: const TextStyle(
          color: ColorAddition.pauaColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 32 / 24,
        ),
      ),
    );
  }
}

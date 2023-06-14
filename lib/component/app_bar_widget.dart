import 'package:flutter/material.dart';
import 'package:sample_project/shared/constants/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({this.showPrefix = true, Key? key}) : super(key: key);
  final bool showPrefix;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(children: [
          if (showPrefix)
            Container(
                margin: const EdgeInsets.only(top: 3),
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_sharp,
                        size: 24, color: ColorAddition.woodsmokeColor)))
        ]));
  }
}

import 'package:flutter/material.dart';

mixin ThemeStatelessAddition<T extends StatelessWidget> {
  Color primaryColor(BuildContext context) => Theme.of(context).primaryColor;
}

mixin ThemeAddition<T extends StatefulWidget> on State<T> {
  Color get primaryColor => Theme.of(context).primaryColor;
}

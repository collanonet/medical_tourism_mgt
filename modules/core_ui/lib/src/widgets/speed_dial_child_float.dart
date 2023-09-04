import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../resources.dart';

SpeedDialChild speedDialChildFloat({
  Widget? child,
  Color? backgroundColor,
  Color? foregroundColor,
  String? label,
  void Function()? onTap,
}) =>
    SpeedDialChild(
      child: child ?? Icon(AppIcons.personAdd),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      label: label,
      labelBackgroundColor: Colors.transparent,
      labelShadow: [],
      elevation: 0,
      onTap: onTap,
    );

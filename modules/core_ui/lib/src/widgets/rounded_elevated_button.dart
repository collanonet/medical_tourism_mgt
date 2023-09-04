import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: label,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            elevation: const MaterialStatePropertyAll(0),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.fromLTRB(8.0, 8.0, 14.0, 8.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const StadiumBorder(),
            ),
          ),
    );
  }
}

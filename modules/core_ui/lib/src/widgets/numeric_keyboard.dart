import 'package:flutter/material.dart';

import '../../core_ui.dart';

typedef KeyPressedCallback = void Function(String text);

class NumericKeyboard extends StatelessWidget {
  /// Color of the text [default = Colors.black]
  final Color buttonColor;

  final Widget? right;

  final Widget? left;

  /// Callback when an item is pressed
  final KeyPressedCallback onNumKeyPressed;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const NumericKeyboard({
    Key? key,
    required this.onNumKeyPressed,
    this.buttonColor = Colors.white,
    this.left,
    this.right,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Colors.black12,
          buttonColor,
          buttonColor,
        ], radius: 0.96, focal: Alignment.center),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButtonTheme(
        data: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            disabledIconColor: context.appTheme.disabledColor,
            shape: const LinearBorder(),
            foregroundColor: context.appTheme.primaryTextColor,
            textStyle: const TextStyle(fontSize: 28.0),
            iconColor: context.appTheme.primaryTextColor,
          ),
        ),
        child: GridView.count(
          childAspectRatio: 1.5,
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            ...List.generate(9, (index) {
              final value = (index + 1).toString();
              return KeyButton(
                onPressed: () => onNumKeyPressed(value),
                child: Text(value),
              );
            }),
            left != null ? left! : const KeyButton(child: SizedBox()),
            KeyButton(
              onPressed: () => onNumKeyPressed('0'),
              child: const Text('0'),
            ),
            right != null ? right! : const KeyButton(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class KeyButton extends StatelessWidget {
  const KeyButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: child,
      ),
    );
  }
}

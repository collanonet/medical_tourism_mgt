import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.selectedIndex,
    required this.menu,
    this.onPressed,
  });

  final int selectedIndex;
  final List<String> menu;
  final Function(int index)? onPressed;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: context.appTheme.spacing.marginMedium,
      spacing: context.appTheme.spacing.marginMedium,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: List.generate(
        menu.length,
        (index) => index == selectedIndex
            ? FilledButton(
                onPressed: () {
                  onPressed?.call(index);
                },
                child: Text(menu[index]))
            : OutlinedButton(
                onPressed: () {
                  onPressed?.call(index);
                },
                child: Text(menu[index])),
      ),
    );
  }
}

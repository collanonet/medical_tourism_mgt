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
      runSpacing: context.appTheme.spacing.marginSmall,
      spacing: context.appTheme.spacing.marginSmall,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: List.generate(
        menu.length,
        (index) => index == selectedIndex
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: context.appTheme.primaryColor,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  side: BorderSide(
                      color: context.appTheme.primaryColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      ),
                      topRight: Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  onPressed?.call(index);
                },
                child: Text(menu[index]))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: context.appTheme.primaryColor,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  side: BorderSide(
                      color: context.appTheme.primaryColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      ),
                      topRight: Radius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  onPressed?.call(index);
                },
                child: Text(menu[index])),
      ),
    );
  }
}

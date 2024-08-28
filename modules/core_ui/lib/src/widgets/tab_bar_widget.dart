// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../core_ui.dart';

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
      alignment: WrapAlignment.start,
      runSpacing: context.appTheme.spacing.marginSmall,
      spacing: context.appTheme.spacing.marginSmall,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: List.generate(
        menu.length,
        (index) => Badge(
          label: const Text(
            '1',
            style: TextStyle(
              fontFamily: 'NotoSansJP',
              package: 'core_ui',
            ),
          ),
          isLabelVisible: index == 20,
          child: index == selectedIndex
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: context.appTheme.primaryColor,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                    side: BorderSide(
                        color: context.appTheme.primaryColor, width: 2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          6,
                        ),
                        topRight: Radius.circular(
                          6,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    onPressed?.call(index);
                  },
                  child: Text(menu[index],
                      style: const TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                      )),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: context.appTheme.primaryColor,
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                    side: BorderSide(
                        color: context.appTheme.primaryColor, width: 2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          6,
                        ),
                        topRight: Radius.circular(
                          6,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    onPressed?.call(index);
                  },
                  child: Text(
                    menu[index],
                    style: const TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

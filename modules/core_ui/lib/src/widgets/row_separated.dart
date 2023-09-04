import 'package:flutter/widgets.dart';

class RowSeparated extends StatelessWidget {
  final IndexedWidgetBuilder separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  const RowSeparated({
    super.key,
    required this.separatorBuilder,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        ...List.generate(
          (children.length * 2) - 1,
          (index) {
            final itemIndex = index ~/ 2;
            if (index.isEven) {
              return children[itemIndex];
            } else {
              return separatorBuilder(context, itemIndex);
            }
          },
        ),
      ],
    );
  }
}

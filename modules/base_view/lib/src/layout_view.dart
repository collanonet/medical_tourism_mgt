// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';

// Project imports:
import '../base_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({
    super.key,
    required this.selectedIndex,
    required this.page,
  });

  final int selectedIndex;
  final Widget page;

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primaryBackgroundColor,
      body: Row(
        children: [
          // Sidebar
          SideBarMenu(
            selectedIndex: widget.selectedIndex,
          ),
          // Main content
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
              child: widget.page,
            ),
          ),
        ],
      ),
    );
  }
}

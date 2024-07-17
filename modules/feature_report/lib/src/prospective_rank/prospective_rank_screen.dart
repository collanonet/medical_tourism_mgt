import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ProspectivePankScreen extends StatefulWidget {
  const ProspectivePankScreen({super.key});

  @override
  State<ProspectivePankScreen> createState() => _ProspectivePankScreenState();
}

class _ProspectivePankScreenState extends State<ProspectivePankScreen> {
  @override
  Widget build(BuildContext context) {
    String filterText = '';
    return Column(
      children: [
        SegmentedButton<String>(
          showSelectedIcon: false,
          style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(color: context.appTheme.primaryColor)),
            ),
            foregroundColor:
                MaterialStatePropertyAll(context.appTheme.primaryColor),
            side: MaterialStatePropertyAll(
              BorderSide(color: context.appTheme.primaryColor),
            ),
          ),
          segments: <ButtonSegment<String>>[
            ButtonSegment<String>(
              value: '受注',
              label: Text(
                '受注のみ',
                style: TextStyle(
                  color: filterText == '受注'
                      ? Colors.white
                      : context.appTheme.primaryColor,
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                ),
              ),
              tooltip: context.l10n.labelOrdersOnly,
            ),
            ButtonSegment<String>(
              value: 'CXL',
              label: Text(
                'CXL',
                style: TextStyle(
                  color: filterText == 'CXL'
                      ? Colors.white
                      : context.appTheme.primaryColor,
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                ),
              ),
              tooltip: context.l10n.labelCXL,
            ),
          ],
          selected: <String>{filterText},
          onSelectionChanged: (Set<String> newSelection) {
            setState(() {
              if (filterText == newSelection.first) {
                filterText = '受注';
              } else {
                filterText = 'CXL';
              }
            });
          },
        ),
      ],
    );
  }
}

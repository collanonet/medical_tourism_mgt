import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_hospital/src/detail/tabs/q_and_a/section/g_and_a_list_section.dart';
import 'package:feature_hospital/src/detail/tabs/q_and_a/section/q_and_a_new_registration_section.dart';
import 'package:flutter/material.dart';

class QAndASection extends StatefulWidget {
  const QAndASection({super.key});

  @override
  State<QAndASection> createState() => _QAndASectionState();
}

class _QAndASectionState extends State<QAndASection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnSeparated(
        separatorBuilder: ((context, index) => SizedBox(
              height: context.appTheme.spacing.formSpacing,
            )),
        children: const [
          QAndANewRegistrationSection(),
        ],
      ),
    );
  }
}

//QAndAListSection()